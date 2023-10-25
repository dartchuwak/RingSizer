//
//  Finger.swift
//  RingSizer
//
//  Created by Evgenii Mikhailov on 22.10.2023.
//

import SwiftUI

struct Finger: View {

    @Binding var size: Double
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                .foregroundColor(.blue)
                .frame(width: UIScreen.main.bounds.width / 2)
                .offset(y:150)
            Image("finger")
                .resizable()
                .frame(width: size)
                .offset(y: 200)
        }
    }
}

#Preview {
    Finger(size: .constant(128))
}
