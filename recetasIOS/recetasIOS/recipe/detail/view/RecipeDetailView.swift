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
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding()
                        /*HStack(spacing: 5) {
                            ForEach(1 ..< 6) { star in
                                Image(systemName: star <= Int(recipeDetail?.name ?? 0) ? "star.fill" : "star")
                                    .font(.system(size: 20))
                                    .foregroundColor(.yellow)
                            }
                        }*/
                    }
                    
                    Text(recipeDetail?.name ?? "")
                        .font(.callout)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    HStack(spacing: 20) {
                        VStack {
                            Text("HOLLAAA")
                                .font(.system(size: 12))
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding([.top, .trailing, .leading], 8)
                            Text(recipeDetail?.name ?? "")
                                .font(.system(size: 12))
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding(.top, 0.4)
                                .padding(.bottom, 8)
                        }
                        .frame(width: 160, height: 70)
                        .background(Color("LightGrey"))
                        
                        VStack {
                            Text("HOLAAA")
                                .font(.system(size: 12))
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding([.top, .trailing, .leading], 8)
                            Text(recipeDetail?.name ?? "")
                                .font(.system(size: 12))
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding(.top, 0.4)
                                .padding(.bottom, 8)
                            
                        }
                        .frame(width: 160, height: 70)
                        .background(Color("LightGrey"))
                        
                    }
                    .onAppear {
                        withAnimation(.linear(duration: 1)) {
                            imageScale = 1
                        }
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
