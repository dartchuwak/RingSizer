//
//  SettingsCell.swift
//  RingSizer
//
//  Created by Evgenii Mikhailov on 21.10.2023.
//

import SwiftUI

struct SettingsCell: View {
    let imageName: String
    let text: String
    let needsPicker: Bool
    let needsStepper: Bool

    @ObservedObject var viewModel: SettingsViewModel
    @Binding var selectedCountry: String
    @Binding var selectedAccuracy: Int

    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(text)
            if needsPicker {
                Picker("", selection: $selectedCountry) {
                    ForEach(viewModel.measurementSystems, id: \.country) { system in
                            Text(system.country).tag(system.country)
                        }
                    }
                .tint(.black)
                .buttonStyle(.bordered)
                .pickerStyle(.menu)
            }
        }
    }
}

#Preview {
    SettingsCell(imageName: "globe", text: "Current country", needsPicker: false, needsStepper: true, viewModel: SettingsViewModel(), selectedCountry: .constant("USA"), selectedAccuracy: .constant(5))
}
