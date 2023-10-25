//
//  FingerView.swift
//  RingSizer
//
//  Created by Evgenii Mikhailov on 20.10.2023.
//

import SwiftUI
import SlidingRuler

struct FingerView: View {

    @EnvironmentObject var ringSizerViewModel: RingSizeViewModel
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    @State private var ringSize: Double = 100

    private var formatter: NumberFormatter {
        let f = NumberFormatter()
        f.numberStyle = .none
        f.maximumFractionDigits = 0
        return f
    }

    @State private var isVisible = false
    @State private var showOverlay = false
    @State private var isSettingsViewPresented = false


    var body: some View {
        VStack {
            //
            Spacer()
                .frame(height: 10)
            //
            HStack {
                Button(action: {
                    isSettingsViewPresented.toggle()
                }, label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title)
                })
                .fullScreenCover(isPresented: $isSettingsViewPresented, content: {
                    SettingsView()
                })
                .foregroundColor(.black)
                //
                Spacer()
                //
                Button(action: {
                    isSettingsViewPresented.toggle()
                }, label: {
                    Image(systemName: "info.circle")
                        .font(.title)
                })
                .fullScreenCover(isPresented: $isSettingsViewPresented, content: {
                    SettingsView()
                })
                .foregroundColor(.black)
            }.padding(.horizontal)
            //
            
            //
            Spacer()
            Button(action: {
                buttonPressed()
            }) {
                Text("Get the ring size")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
            }
            .background(ringSizerViewModel.isVisible ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .clipShape(Capsule())
            HStack {
                Finger(size: $ringSize)
            }
        }
        .overlay (
            Group {
                if showOverlay {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    ResultView(viewModel: ringSizerViewModel, showOverlay: $showOverlay)
                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .circular))
                }
            }

        )
        .overlay {
            SlidingRuler(value: $ringSize, in: 75...180, step: 20)
                .slidingRulerStyle(BlankCenteredSlidingRulerStyle())
                .rotationEffect(.degrees(90))
                .offset(x:150, y: 120)

        }

    }

    func buttonPressed() {
        ringSizerViewModel.ringSize = ringSize
        withAnimation {
            showOverlay.toggle()
        }

    }
}

#Preview {
    FingerView()
        .environmentObject(RingSizeViewModel())
}
