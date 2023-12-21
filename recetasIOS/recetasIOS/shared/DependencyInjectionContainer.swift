//
//  DependencyInjectionContainer.swift
//  recetasIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation
import Swinject

final class DependencyInjectionContainer {
    static let shared = DependencyInjectionContainer()

    let assembler: Assembler
    
    init() {
        assembler = Assembler(
            [
                RecipeListDependencyAssembler(),
                HttpClientAssembler(),
                RecipeAssembler(),
                RecipeDetailDependencyAssembler()
            ]
        )
    }
        
    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return assembler.resolver.resolve(serviceType)
    }
    
    func resolve<Service>(_ serviceType: Service.Type, argument arg1: String) -> Service? {
        return assembler.resolver.resolve(serviceType, argument: arg1)
    }
}
