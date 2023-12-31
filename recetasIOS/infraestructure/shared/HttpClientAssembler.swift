//
//  HttpClientAssembler.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation
import Swinject

public final class HttpClientAssembler: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
    
        container.register(HttpClient.self) { _ in
            HttpClient()
        }
        .inObjectScope(.container)
    }
    
}
