//
//  RecipeListView.swift
//  recetasIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import SwiftUI
import Foundation

struct RecipeLisView<ViewModel>: View where ViewModel: RecipeListViewModelObservable {
    @ObservedObject private var viewModel: ViewModel
    @State private var searchText: String = ""

    @SwiftUI.State var currentIndex: Int = 0
    @SwiftUI.State var id: Int = 0
    @SwiftUI.State var isPresented: Bool = false
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    func showCardRecipeView(recipes: [Recipe]) -> some View {
        CustomCarouselView(index: $currentIndex,
                           items: recipes,
                           cardPadding: 150,
                           id: \.id) { recipe, cardSize in
            RecipeCardView(recipe: recipe, screenSize: cardSize) {
                viewModel.idRecipe = String(recipe.id)
                isPresented.toggle()
            }
        }
        
    }
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(.all,edges: .all)
            switch viewModel.state {
            case .LOADING:
                ProgressView()
            case .SUCCESS(let recipes):
                Color("DarkBlue").ignoresSafeArea(.all,edges: .all)
                
                VStack {
                    // Buscador
                    HStack(alignment: .center) {
                        SearchRecipeTextfieldView(placeholder: "EJEMPLO", text: $searchText)
                            .autocorrectionDisabled()
                            .accessibility(identifier: "ProductSearchField")
                    }
                    
                    Spacer()
                    
                    // Lista
                    List {
                      ForEach(recipes.filter({ searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased()) }), id: \.id) { recipe in
                          
                          RecipeView(recipe: recipe)
                        /*NavigationLink(destination: RecipeDetailView(recipe: Recipe)) {
                            RecipeView(recipe: recipe)
                        }*/
                      }
                    }
                }
            case .FAILURE(let error):
                Text("My error: \(error)")
                    .padding(.horizontal)
            }
        }
    }
}

#if DEBUG
struct RecipeLisView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeLisView(viewModel: DependencyInjectionContainer.shared.resolve(RecipeListViewModel.self)!)
    }
}
#endif

struct SearchRecipeTextfieldView: View {
    
  var placeholder: String
  @Binding var text: String
    
  var body: some View {
    TextField(placeholder, text: $text)
      .padding(7)
      .background(Color(.systemGray6))
      .cornerRadius(30)
      .padding(.horizontal, 10)
      .shadow(color: .gray, radius: 1, x: 0, y: 1)
  }
}

struct RecipeView: View {
    
    var recipe: Recipe
    @State private var imageScale: CGFloat = 0.25
    
    var body: some View {
        
        ZStack() {
            URLImageView(imageUrl: recipe.urlImage)
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .padding()
            }
        }
        .frame(height: 280)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
        .onTapGesture {
            
        }
    }
}
