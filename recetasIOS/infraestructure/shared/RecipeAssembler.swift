//
//  RecipeAssembler.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation
import Swinject

public class RecipeAssembler: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        
        container.register(RecipeRepository.self) { container in
            RecipeAlamofireRepository(httpClient: container.resolve(HttpClient.self)!)
        }
        .inObjectScope(.container)

    }
    
}

