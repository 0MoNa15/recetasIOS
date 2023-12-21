//
//  LocationTranslator.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

struct LocationTranslator {
    
    static func fromDtoToDomain(locationDto: LocationDto) throws -> Location {
        
        let country = try CountryTranslator.fromDtoToDomain(countryDto: locationDto.country)
        
        let location = try Location(
            latitude: locationDto.latitude,
            longitude: locationDto.longitude,
            city: locationDto.city,
            country: country
        )
        return location
    }
}

