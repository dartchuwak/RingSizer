//
//  RingSizeViewModel.swift
//  RingSizer
//
//  Created by Evgenii Mikhailov on 20.10.2023.
//

import Foundation
import UIKit
import DeviceKit

class RingSizeViewModel: ObservableObject {

    let scale = UIScreen.main.scale
    let nativeBounds = UIScreen.main.nativeBounds
    let device = Device.current
    let diagonal = Device.current.diagonal
    let screenWidth = UIScreen.main.bounds.width - 30
    @Published var isVisible: Bool = false
    @Published var selectedCountry: String = "Metric" {
        didSet {
         //   saveUserDefaults(system: selectedCountry)
        }
    }

    @Published var selectedAccuracy: Int = 5
    @Published var ringSize: Double = 0.0
    let maxRingSizeInPoints: Double = 150
    let minRingSizeInPoints: Double = 50
    let maxRingSize: Double = 200
    let minRingSize: Double = 50

    func printDebigDeviceInfo() {
        print (nativeBounds.width, nativeBounds.height)
        print (device)
        print (diagonal)
    }

     private func convertPointsToMillimeters(poins: CGFloat) -> CGFloat {
        let pixels = poins * scale
        let inches  = pixels / getCurrentPPI()
        let millimeters = inches * 25.4
        return millimeters
    }


    private func convertPointsToInches(poins: CGFloat) -> CGFloat {
        let pixels = poins * scale
        let inches  = pixels / getCurrentPPI()
        print (inches)
        return inches
    }

//    func convertMillimetersToPoints(mm: CGFloat) -> CGFloat {
//        let inches = mm / 25.4
//        let pixels = inches * getCurrentDPI()
//        let points = pixels / scale
//        return points
//    }

    private func getCurrentPPI() -> CGFloat {
        let diagonalInPixels = sqrt(pow(nativeBounds.width, 2) + pow(nativeBounds.height, 2))
        let dpi = diagonalInPixels / diagonal
        return dpi
    }

    func convert(points: CGFloat) -> String {

        if selectedCountry == "USA" {
            let number = convertPointsToInches(poins: points)
            return String(format: "%.3f", number)
        }

        if selectedCountry == "Metric" {
            let number =  convertPointsToMillimeters(poins: points)
            return String(format: "%.1f", number)
        }

        let number = convertPointsToMillimeters(poins: points)
        return String(format: "%.1f", number)
    }

    func loadUserDefaults() -> String {
        if let system = UserDefaults.standard.string(forKey: "measure") {
            return system
        } else {
            return "Metric"
        }
    }

    func saveUserDefaults(system: String) {
        UserDefaults.standard.setValue(system, forKey: "measure")
    }
}
