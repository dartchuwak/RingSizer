//
//  ResultView.swift
//  RingSizer
//
//  Created by Evgenii Mikhailov on 20.10.2023.
//

import SwiftUI

struct ResultView: View {

    @ObservedObject var viewModel: RingSizeViewModel

    @Binding var showOverlay: Bool

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 20)
                HStack {
                    Spacer()
                    Image(systemName: "xmark")
                        .onTapGesture {
                            showOverlay.toggle()
                        }
                }
                Spacer()
            }
            .padding(.horizontal)
            VStack {
                Spacer()
                Text("Your ring size")
                Spacer().frame(height: 20)
                Image("ring")
                    .resizable()
                    .frame(width: 60,
                           height: 60)
                Spacer().frame(height: 20)
                Text(viewModel.convert(points: viewModel.ringSize))
                Button(action: {
                    buttonPressed()
                }) { HStack {
                    Image(systemName: "paperplane")
                    Text("Share")
                }
                .padding(10)

                }
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                Spacer()
            }
        }
        .frame(width: 300, height: 300)
        .background(Color.yellow)

    }

    func buttonPressed() {

    }
}

#Preview {
    ResultView(viewModel: RingSizeViewModel(), showOverlay: .constant(true))
}
