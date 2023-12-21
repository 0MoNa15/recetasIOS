//
//  CountryDto.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

struct CountryDto: Codable {
    let name: String
    let flag: String

    enum CodingKeys: String, CodingKey {
        case name = "nombre"
        case flag = "bandera"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        flag = try container.decode(String.self, forKey: .flag)
    }
}
