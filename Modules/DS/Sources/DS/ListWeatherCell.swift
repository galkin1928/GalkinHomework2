//
//  ListWeatherCell.swift
//
//
//  Created by GALKIN Aleksandr on 13.11.2024.
//

import SwiftUI

public struct ListWeatherCell: View {
    let title: String
    let value: String
    let icon: String

    public init(title: String, value: String, icon: String) {
        self.title = title
        self.value = value
        self.icon = icon
    }

    @available(iOS 13.0, *)
    public var body: some View {
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
