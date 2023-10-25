//
//  RingView.swift
//  RingSizer
//
//  Created by Evgenii Mikhailov on 20.10.2023.
//

import SwiftUI
import SlidingRuler

struct RingView: View {



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
                .foregroundStyle(Color("baseColor"))
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
                .foregroundStyle(Color("baseColor"))
            }.padding(.horizontal)
            //
            VStack {
                Text("Place your ring")
                    .font(.title)
                    .foregroundStyle(Color("baseColor"))
                Text("on the circle")
                    .font(.title)
                    .foregroundStyle(Color("baseColor"))
            }

            //
            Spacer()
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                    .frame(width: ringSizerViewModel.screenWidth, height: ringSizerViewModel.screenWidth)
                    .foregroundColor(Color(white: 0.95))
                Circle()
                    .foregroundStyle(Color("baseColor"))
                    .frame(width: ringSize,
                           height: ringSize)
                Button(action: {
                    buttonPressed()
                }) {
                    Text("Get the ring size")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                }
                .background(ringSizerViewModel.isVisible ? Color("baseColor") : Color.gray)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .offset(y: (ringSizerViewModel.screenWidth / 3))
            }
            Spacer()

            Text("Use the slider to adjust size")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(Color("baseColor"))
            Spacer()
                .frame(height: 10)
            Text(ringSizerViewModel.convert(points: ringSize).description)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(Color("baseColor"))
            SliderView(ringSize: $ringSize, ringSizerViewModel: ringSizerViewModel)
                .scaleEffect(CGSize(width: 1.5, height: 1.5))
                .foregroundStyle(Color("baseColor"))
            Spacer()
        }
        .background(Color.white)
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
    }

    func buttonPressed() {
        ringSizerViewModel.ringSize = ringSize
        withAnimation {
            showOverlay.toggle()
        }


    }
}

#Preview {
    RingView()
        .environmentObject(RingSizeViewModel())
}
