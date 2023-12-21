//
//  Country.swift
//  domain
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

public struct Country: Equatable {
    let name: String
    let flag: String

    init(name: String, flag: String) {
        self.name = name
        self.flag = flag
    }
}
