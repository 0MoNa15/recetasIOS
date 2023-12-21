//
//  RecipesListDto.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation


struct RecipesDto: Codable {
    
    let recipes: [RecipeDto]
    
    enum CodingKeys: String, CodingKey {
        case recipes = "recetas"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let results = try container.decode([RecipeDto].self, forKey: .recipes)

        self.recipes = results
    }
}
