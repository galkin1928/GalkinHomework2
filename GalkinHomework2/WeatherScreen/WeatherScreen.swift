//
//  WeatherScreen.swift
//  GalkinHomework2
//
//  Created by GALKIN Aleksandr on 04.11.2024.
//

import SwiftUI
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

struct WeatherScreen: View {
    @State var weather: CurrentWeatherData = .init()
    var city: String
    var body: some View {
        List {
            if let temperature = weather.temperature {
                ListWeatherCell(title: "Температура", value: "\(temperature) C", icon: "thermometer.medium")
            }
            if let humidity = weather.humidity {
                ListWeatherCell(title: "Влажность", value: "\(humidity) %", icon: "humidity")
            }
            if let windSpeed = weather.windSpeed {
                ListWeatherCell(title: "Скорость ветра", value: "\(windSpeed) m/s", icon: "wind")
            }
            if let pressure = weather.pressure {
                ListWeatherCell(title: "Давление", value: "\(pressure)", icon: "thermometer.variable.and.figure.circle")
            }
            if let precip = weather.precip {
                ListWeatherCell(title: "Осадки", value: "\(precip) %", icon: "cloud.drizzle")
            }
            if let uvIndex = weather.uvIndex {
                ListWeatherCell(title: "Ультрафиолетовый индекс", value: "\(uvIndex)", icon: "sun.max.trianglebadge.exclamationmark.fill")
            }
            if let visibility = weather.visibility {
                ListWeatherCell(title: "Видимость", value: "\(visibility)", icon: "text.justify")
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
        WeatherCities.getWeather(city: city) { weather = $0 }
    }

}

struct ListWeatherCell: View {
    let title: String
    let value: String
    let icon: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius : 20).foregroundStyle(.gray)
            VStack {
                HStack {
                    Image(systemName: icon)
                        .foregroundStyle(.white)
                        .font(.title)
                    Text(title)
                        .foregroundStyle(.white)
                        .font(.title)
                }
                Text(value)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    WeatherScreen(city: "Porto")
}
