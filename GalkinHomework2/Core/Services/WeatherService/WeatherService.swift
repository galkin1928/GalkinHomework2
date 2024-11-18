//
//  WeatherService.swift
//  GalkinHomework2
//
//  Created by GALKIN Aleksandr on 18.11.2024.
//

import Foundation
import WeatherNetwork

class WeatherService {

    private let network: NetworkService
    private let storage: StorageService

    init(network: NetworkService, storage: StorageService) {
        self.network = network
        self.storage = storage
    }

    func getWeather(for city: String, onComplete: @escaping (CurrentWeatherData?) -> Void) {
        DefaultAPI.getCurrentWeather(
            accessKey: "4e1edd2c575541dddfdfbf81419562eb",
            query: city
        ) { [weak self] (data: CurrentWeatherResponse?, error: Error?) in
            guard let current = data?.current else {
                guard let weatherFromCache = self?.storage.fetchWeatherFromCache(city: city) else {
                    onComplete(nil)
                    return
                }
                var weather = CurrentWeatherData()
                weather.temperature = weatherFromCache.temperature
                onComplete(weather)
                return
            }

            self?.storage.saveWeatherToCache(city: city, temperature: current.temperature)
            onComplete(current)
        }
    }

}
