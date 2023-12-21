//
//  LocationDto.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

struct LocationDto: Codable {
    let latitude: Double
    let longitude: Double
    let city: String
    let country: CountryDto
    
    enum CodingKeys: String, CodingKey {
        case latitude = "latitud"
        case longitude = "longitud"
        case city = "ciudad"
        case country = "pais"
    }

    init(from decoder: Decoder)throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        city = try container.decode(String.self, forKey: .city)
        country = try container.decode(CountryDto.self, forKey: .country)
    }
}
