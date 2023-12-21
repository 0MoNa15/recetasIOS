//
//  recetasIOSApp.swift
//  recetasIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import SwiftUI

@main
struct recetasIOSApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RecipeLisView(viewModel: DependencyInjectionContainer.shared.resolve(RecipeListViewModel.self)!)
            }
        }
    }
}
