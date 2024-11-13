//
//  WeatherCitiesModel.swift
//  GalkinHomework2
//
//  Created by GALKIN Aleksandr on 13.11.2024.
//

import WeatherNetwork

struct WeatherCities {
    var weather: CurrentWeatherData?
    static func getWeather(city: String, onComplete: @escaping (CurrentWeatherData) -> Void) {
        DefaultAPI.getCurrentWeather(
            accessKey: "4e1edd2c575541dddfdfbf81419562eb",
            query: city) { data, error in
                onComplete(data?.current ?? .init())
            }
    }
}
