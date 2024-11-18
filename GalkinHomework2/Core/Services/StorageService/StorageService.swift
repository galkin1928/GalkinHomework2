//
//  StorageService.swift
//  GalkinHomework2
//
//  Created by GALKIN Aleksandr on 06.11.2024.
//

import WeatherNetwork
import SwiftData
import SwiftUI

final class StorageService {

    func saveWeatherToCache(city: String, temperature: Int?) {
        guard let container = try? ModelContainer(for: WeatherCache.self),
            let temperature else { return }
        let context = ModelContext(container)
        let weather = WeatherCache(city: city, temperature: temperature, lastUpdated: Date())
        context.insert(weather)

        do {
            try context.save()
            print("Weather data cached successfully")
        } catch {
            print("Failed to save weather data: \(error)")
        }
    }

    func fetchWeatherFromCache(city: String) -> WeatherCache? {
        guard let container = try? ModelContainer(for: WeatherCache.self) else { return nil }
        let context = ModelContext(container)
        let fetchDescriptor = FetchDescriptor<WeatherCache>(predicate: #Predicate { $0.city == city })
        let results = try? context.fetch(fetchDescriptor)
        return results?.first
    }
}
