//
//  WeatherButton.swift
//  WeatherAppUI
//
//  Created by Abdullah Zawahreh on 7/23/24.
//

import SwiftUI

struct WeatherButtonView: View {
    
    var buttonText: String
    var background: Color
    var foreBackground: Color
    
    var body: some View {
        Text(buttonText)
            .frame(width: 280, height: 50)
            .background(self.background)
            .foregroundColor(self.foreBackground)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(30)
    }
}
