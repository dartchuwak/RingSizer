//
//  ContentView.swift
//  RingSizer
//
//  Created by Evgenii Mikhailov on 20.10.2023.
//

import SwiftUI

struct TabbedView: View {

    @EnvironmentObject var viewModel: RingSizeViewModel

    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        }

    var body: some View {

            TabView {
                RingView()
                    .tabItem {
                        Label("Ring", systemImage: "circle")
                    }

                FingerView()
                    .tabItem {
                        Label("Finger", systemImage: "hand.raised.fingers.spread.fill")
                    }
            }.onAppear {
                viewModel.selectedCountry = viewModel.loadUserDefaults()
            }
        }
    }

#Preview {
    TabbedView()
        .environmentObject(RingSizeViewModel())
}
