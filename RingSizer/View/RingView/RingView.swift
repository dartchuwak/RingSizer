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
            Spacer().frame(height: 40)
            Text("Place your ring on the circle")
                .font(.title)
                .foregroundStyle(Color("baseColor"))
            Spacer().frame(height: 32)
            ExtractedView(ringSize: $ringSize, ringSizerViewModel: ringSizerViewModel)
            Spacer().frame(height: 32)
            Button(action: {
                buttonPressed()
            }) {
                Text("Get the ring size")
                    .fontWeight(.medium)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
            }
            .background(ringSizerViewModel.isVisible ? Color("baseColor") : Color.gray)
            .foregroundColor(.white)
            .clipShape(Capsule())
            Spacer().frame(height: 32)
            Text("Use the slider to adjust size")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(Color("baseColor"))
            Spacer()
                .frame(height: 32)
            Text("\(ringSizerViewModel.convert(points: ringSize).description) mm")
                .font(.system(size: 32))
                .fontWeight(.heavy)
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
        .environmentObject(SettingsViewModel())
}

struct ExtractedView: View {
    @Binding var ringSize: Double
    let ringSizerViewModel: RingSizeViewModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                .frame(width: ringSizerViewModel.screenWidth, height: ringSizerViewModel.screenWidth)
                .foregroundColor(Color(white: 0.95))
            VStack {
                Circle()
                    .stroke(.black, lineWidth: 3)
                    .foregroundStyle(.clear)
                    .frame(width: ringSize,
                           height: ringSize)
            }
            .frame(width: ringSizerViewModel.screenWidth, height: ringSizerViewModel.screenWidth)
        }
    }
}
