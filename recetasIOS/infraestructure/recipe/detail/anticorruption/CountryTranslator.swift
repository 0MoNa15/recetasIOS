//
//  CountryTranslator.swift
//  recetasIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

struct CountryTranslator {
    
    static func fromDtoToDomain(countryDto: CountryDto) throws -> Country {
        let country = try Country(
            name: countryDto.name,
            flag: countryDto.flag
        )
        return country
    }
}
