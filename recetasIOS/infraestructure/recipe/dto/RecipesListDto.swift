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
        case recipes = "recipes"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        guard let results = try container.decodeIfPresent([RecipeDto].self, forKey: .recipes) else {
            throw DecodingError.keyNotFound(CodingKeys.recipes, DecodingError.Context(codingPath: [CodingKeys.recipes], debugDescription: "Results field is missing or nil"))
        }
        self.recipes = results
    }
}
