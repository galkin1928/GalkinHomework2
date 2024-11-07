//
//  ServiceLocator.swift
//  GalkinHomework2
//
//  Created by GALKIN Aleksandr on 06.11.2024.
//

import Foundation

enum ServiceLocatorError: Error {
    case serviceNotFound
}

class ServiceLocator {

    static let shared = ServiceLocator()

    private init() {}

    private var services: [String: AnyObject] = .init()

    func register<T:AnyObject>(_ service: T) {
        let key = String(describing: T.self)
        guard services[key] == nil else { return }
        services[key] = service
    }

    func resolve<T: AnyObject>() throws -> T? {
        let key = String(describing: T.self)
        if let service = services[key] as? T {
            return service
        } else {
            throw ServiceLocatorError.serviceNotFound
        }
    }
}
