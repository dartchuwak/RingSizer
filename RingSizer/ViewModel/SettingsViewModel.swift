//
//  SettingsViewModel.swift
//  RingSizer
//
//  Created by Evgenii Mikhailov on 21.10.2023.
//

import Foundation

class SettingsViewModel: ObservableObject, Observable {
    let appVersion: String?
    var items: [SettingsModel]

    init() {
         appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
         items = [
            .init(imageName: "globe", text: "Current country", needsPicker: true, needsStepper: false),
            .init(imageName: "globe", text: "App version \(appVersion ?? "")", needsPicker: false, needsStepper: false)
        ]
    }



    let measurementSystems = [
        MeasurementSystem(country: "USA", units: "inches"),
        MeasurementSystem(country: "Metric", units: "millimeters"),
        // Добавьте другие страны и системы измерения
    ]
}


