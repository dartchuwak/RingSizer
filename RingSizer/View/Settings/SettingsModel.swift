//
//  SettingsModel.swift
//  RingSizer
//
//  Created by Evgenii Mikhailov on 21.10.2023.
//

import Foundation

struct SettingsModel: Identifiable, Equatable {
    var id: UUID = UUID()
    let imageName: String
    let text: String
    let needsPicker: Bool
    let needsStepper: Bool
}
