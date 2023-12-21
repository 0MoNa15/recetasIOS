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
                showCardRecipeView(recipes: recipes)
                    .fullScreenCover(isPresented: $isPresented) {
                        RecipeDetailView(viewModel: DependencyInjectionContainer.shared.resolve(
                            RecipeDetailViewModel.self,
                            argument: "COL001")!
                            //argument: viewModel.idRecipe)!
                        )
                    }
                    .padding(.top, 60)
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
