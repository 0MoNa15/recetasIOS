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
    
    @Environment(\.dismiss) var dismiss
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
        
    func descriptionView(recipeDetail: RecipeDetail?) -> some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    URLImageView(imageUrl: recipeDetail?.image ?? "")
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 450)
                        .cornerRadius(5)
                        .padding(.bottom)
                        .scaleEffect(imageScale)
                    
                    VStack {
                        Text(recipeDetail?.name ?? "")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.blue)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                }
                .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity)
            .background(Color("DarkBlue").ignoresSafeArea(.all,edges: .all))
            .toolbarBackground(.hidden, for: .navigationBar)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }

            }
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
