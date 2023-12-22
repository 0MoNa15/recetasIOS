//
//  RecipeDetailView.swift
//  recetasIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import SwiftUI

struct RecipeDetailView<ViewModel>: View where ViewModel: RecipeDetailViewModel {
    
    @ObservedObject private var viewModel: ViewModel
    @State private var imageScale: CGFloat = 0.25
    @State private var showMap: Bool = false
        
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
        
    func descriptionView(recipeDetail: RecipeDetail?) -> some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack() {
                    
                    HStack() {
                        URLImageView(imageUrl: recipeDetail?.image ?? "https://i.ibb.co/rk7Zm7b/changua.jpg")
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .clipped()
                    }
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                }
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(recipeDetail?.name ?? "Nombre receta")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        Text(recipeDetail?.description ?? "Descripcion")
                            .font(.subheadline)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.leading)
                            .padding()
                    }
                
                MapButton(
                  title: "Ver origen de la receta",
                  backgroundColor: .blue.opacity(0.2),
                  foregroundColor: .blue,
                  action: {
                    showMap = true
                  })
                .sheet(isPresented: $showMap, content: {
                  NavigationView {
                    MapView(
                        latitude: recipeDetail?.location.latitude ?? 34.4554,
                        longitude: recipeDetail?.location.longitude ?? 70.171168,
                        city: recipeDetail?.location.city ?? "Lima")
                      .edgesIgnoringSafeArea(.all)
                  }
                })
            }
            .frame(maxWidth: .infinity)
            .background(Color("DarkBlue").ignoresSafeArea(.all,edges: .all))
            .toolbarBackground(.hidden, for: .navigationBar)
        }
        
    }
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .LOADING:
                ProgressView()
            case .SUCCESS(let recipeDetail):
                descriptionView(recipeDetail: recipeDetail)
            case .FAILURE(let error):
                Text("My error: \(error)")
                    .padding(.horizontal)
            }
        }.onAppear {
            viewModel.getRecipeDetail()
        }
    }
}


struct MapButton: View {
  var title: String
  var backgroundColor: Color
  var foregroundColor: Color
  var action: (() -> Void)? = nil
  
  var body: some View {
    Button(action: {
      action?()
    }) {
      Text(title)
        .font(.system(size: 16))
        .fontWeight(.regular)
        .foregroundColor(foregroundColor)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(7)
    }
  }
}
