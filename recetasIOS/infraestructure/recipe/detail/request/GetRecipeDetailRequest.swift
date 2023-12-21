//
//  GetRecipeDetailRequest.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation
import Alamofire

struct GetRecipeDetailRequest: HttpClientRequest {
    
    typealias Model = Any?
    let baseURL: String = "https://demo3790638.mockable.io/"
    let recipeId: String = "COL001"
    
    var enpoint: String { baseURL + "/receta" }
    var httpHeaders: [String : String] = [:]
    var params: [String : Any]?
    var httpMethod: Alamofire.HTTPMethod = .get
    
    init(object: Any?) {
        self.params = ["recipe_id":"\(recipeId)"]
    }
}
