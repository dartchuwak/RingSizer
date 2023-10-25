//
//  SliderView.swift
//  RingSizer
//
//  Created by Evgenii Mikhailov on 22.10.2023.
//

import SwiftUI
import SlidingRuler

struct SliderView: View {

    @Binding var ringSize: Double
    @ObservedObject var ringSizerViewModel: RingSizeViewModel
    var body: some View {
        SlidingRuler(value: $ringSize,
                     in: ringSizerViewModel.minRingSize...ringSizerViewModel.maxRingSize,
                     step: 10,
                     snap: .none,
                     tick: .fraction,
                     onEditingChanged: { newValue in
            ringSizerViewModel.ringSize = ringSize
            withAnimation {
                ringSizerViewModel.isVisible = true
            }
        }, formatter: NumberFormatter())
        .slidingRulerStyle(BlankCenteredSlidingRulerStyle())
        .foregroundStyle(Color("pink"))
    }
}

#Preview {
    SliderView(ringSize: .constant(10), ringSizerViewModel: RingSizeViewModel())
}
