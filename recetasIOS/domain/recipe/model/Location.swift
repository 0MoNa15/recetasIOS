//
//  Location.swift
//  domain
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

class Location {
    let latitude: Double
    let longitude: Double
    let city: String
    let country: Country

    init(latitude: Double, longitude: Double, city: String, country: Country) {
        self.latitude = latitude
        self.longitude = longitude
        self.city = city
        self.country = country
    }
}
