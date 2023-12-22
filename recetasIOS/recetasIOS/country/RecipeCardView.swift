//
//  RecipeCardView.swift
//  recetasIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import SwiftUI

struct RecipeCardView : View {
    private var recipe: Recipe
    private let screenSize: CGSize
    
    @SwiftUI.State private var imageUrl: String
    @SwiftUI.State private var imageOffSet: CGSize = .zero
    private var onTapGestureImage: () -> Void
    
    init(recipe: Recipe,
         screenSize: CGSize,
         onTapGestureImage: @escaping () -> Void) {
        self.recipe = recipe
        self.screenSize = screenSize
        self.imageUrl = recipe.urlImage
        self.onTapGestureImage = onTapGestureImage
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            URLImageView(imageUrl: imageUrl)
                .frame(width: 250, height: 280)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .onTapGesture {
                    onTapGestureImage()
                }
            
            Text(recipe.name)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
            
            Text(recipe.name)
                .lineLimit(4)
                .multilineTextAlignment(.center)
                .font(.callout)
                .foregroundColor(Color.white)
                .padding()
        }
        .frame(width: 280, height: screenSize.height)
        .padding()
    }
}
