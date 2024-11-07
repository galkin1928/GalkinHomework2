//
//  GalkinHomework2App.swift
//  GalkinHomework2
//
//  Created by GALKIN Aleksandr on 21.10.2024.
//

import SwiftUI

@main
struct GalkinHomework2App: App {

    init() {
        registerServices()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    private func registerServices() {
        ServiceLocator.shared.register(NetworkService())
        ServiceLocator.shared.register(StorageService())
    }
}
