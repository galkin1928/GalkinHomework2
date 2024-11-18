//
//  ContentView.swift
//  GalkinHomework2
//
//  Created by GALKIN Aleksandr on 21.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var currentCity = "Red"
    var cities = ["Porto, Portugal", "Lisboa, Portugal", "Moscow"]

    var body: some View {
        NavigationView {
            VStack {
                Picker("What is your favorite color?", selection: $currentCity) {
                    ForEach(cities, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .onAppear {
                    currentCity = cities.first ?? ""
                }

                if let weatherService: WeatherService = try? ServiceLocator.shared.resolve() {
                    WeatherScreen(weatherService: weatherService, city: currentCity)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
