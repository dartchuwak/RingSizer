//
//  SettingsViewModel.swift
//  RingSizer
//
//  Created by Evgenii Mikhailov on 21.10.2023.
//

import Foundation

class SettingsViewModel: ObservableObject, Observable {

  

    var items: [SettingsModel] = [
        .init(imageName: "globe", text: "Current country", needsPicker: true, needsStepper: false),
        .init(imageName: "scroll", text: "Terms of use", needsPicker: false, needsStepper: false),
        .init(imageName: "checkmark.shield", text: "Privacy policy", needsPicker: false, needsStepper: false)
    ]

    let measurementSystems = [
        MeasurementSystem(country: "USA", units: "inches"),
        MeasurementSystem(country: "Metric", units: "millimeters"),
        // Добавьте другие страны и системы измерения
    ]

  //  let accuracy = [0,1,2,3,4,5,6,7,8,9,10]

}


