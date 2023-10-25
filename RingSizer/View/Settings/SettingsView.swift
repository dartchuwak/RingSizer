//
//  SettingView.swift
//  RingSizer
//
//  Created by Evgenii Mikhailov on 20.10.2023.
//

import SwiftUI

struct SettingsView: View {

    @EnvironmentObject var viewModel: SettingsViewModel
    @EnvironmentObject var ringViewModel: RingSizeViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            HStack {
                Spacer().frame(width: 15)
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                })
                .foregroundColor(.black)
                Spacer()
                Button(action: {
                    ringViewModel.saveUserDefaults(system: ringViewModel.selectedCountry)
                    presentationMode.wrappedValue.dismiss()

                }, label: {
                    Text("Save")
                })
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .heavy))
                Spacer().frame(width: 15)
            }
            .overlay (
                Text("Settings")
                    .font(.title)
            )
            Spacer().frame(height: 30)
            List(viewModel.items) { item in
                SettingsCell(imageName: item.imageName,
                             text: item.text, 
                             needsPicker: item.needsPicker,
                             needsStepper: item.needsStepper,
                             viewModel: viewModel,
                             selectedCountry: $ringViewModel.selectedCountry, selectedAccuracy:$ringViewModel.selectedAccuracy)

            }
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(SettingsViewModel())
        .environmentObject(RingSizeViewModel())
}
