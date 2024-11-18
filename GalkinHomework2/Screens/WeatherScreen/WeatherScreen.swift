//
//  WeatherScreen.swift
//  GalkinHomework2
//
//  Created by GALKIN Aleksandr on 04.11.2024.
//

import DS
import SwiftUI
import WeatherNetwork

struct WeatherScreen: View {

    var weatherService: WeatherService
    var city: String

    @State var weather: CurrentWeatherData = .init()
    var body: some View {
        List {
            if let temperature = weather.temperature {
                DS.ListWeatherCell(title: "Температура", value: "\(temperature) C", icon: "thermometer.medium")
            }
            if let humidity = weather.humidity {
                DS.ListWeatherCell(title: "Влажность", value: "\(humidity) %", icon: "humidity")
            }
            if let windSpeed = weather.windSpeed {
                DS.ListWeatherCell(title: "Скорость ветра", value: "\(windSpeed) m/s", icon: "wind")
            }
            if let pressure = weather.pressure {
                DS.ListWeatherCell(title: "Давление", value: "\(pressure)", icon: "thermometer.variable.and.figure.circle")
            }
            if let precip = weather.precip {
                DS.ListWeatherCell(title: "Осадки", value: "\(precip) %", icon: "cloud.drizzle")
            }
            if let uvIndex = weather.uvIndex {
                DS.ListWeatherCell(title: "Ультрафиолетовый индекс", value: "\(uvIndex)", icon: "sun.max.trianglebadge.exclamationmark.fill")
            }
            if let visibility = weather.visibility {
                DS.ListWeatherCell(title: "Видимость", value: "\(visibility)", icon: "text.justify")
            }
        }
        .onAppear {
            loadWeather(for: city)
        }
        .onChange(of: city) { _, newValue in
            loadWeather(for: newValue)
        }
        .navigationTitle(city)
        
    }

    private func loadWeather(for city: String) {
        weatherService.getWeather(for: city) { weather in
            guard let weather else {
                return
            }
            self.weather = weather
        }
    }

}

//#Preview {
//    WeatherScreen(city: "Porto")
//}
