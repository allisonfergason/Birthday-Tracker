//
//  ColorExtensions.swift
//  Birthday Tracker
//
//  Created by Edward Zhou on 9/1/24.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...0.3),
            green: .random(in: 0...0.5),
            blue: .random(in: 0...1)
        )
    }
}
