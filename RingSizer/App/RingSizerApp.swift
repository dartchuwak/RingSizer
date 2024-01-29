//
//  RingSizerApp.swift
//  RingSizer
//
//  Created by Evgenii Mikhailov on 20.10.2023.
//

import SwiftUI


@main
struct RingSizerApp: App {
    let settingsViewModel = SettingsViewModel()
    let ringSizerViewModel = RingSizeViewModel()

    var body: some Scene {
        WindowGroup {
          RingView()
                .environmentObject(settingsViewModel)
                .environmentObject(ringSizerViewModel)
                .preferredColorScheme(.light)
        }
    }
}
