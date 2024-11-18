//
//  WeatherCache.swift
//  GalkinHomework2
//
//  Created by GALKIN Aleksandr on 14.11.2024.
//

import Foundation
import SwiftData

@Model
class WeatherCache {
    @Attribute var city: String
    @Attribute var temperature: Int
    @Attribute var lastUpdated: Date

    init(city: String, temperature: Int, lastUpdated: Date) {
        self.city = city
        self.temperature = temperature
        self.lastUpdated = lastUpdated
    }
}
