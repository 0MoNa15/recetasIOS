//
//  HttpClientRequest.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Alamofire

public protocol HttpClientRequest {
    associatedtype Object
    
    var enpoint: String { get }
    var httpHeaders: [String : String] { get }
    var params: [String: Any]? { get }
    var paramsJSON: String { get }
    var httpMethod: HTTPMethod { get }
    
    init(object: Object)
}

extension HttpClientRequest {
    var paramsJSON: String { "" }
}
