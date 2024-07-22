//
//  ContentView.swift
//  WeatherAppUI
//
//  Created by Abdullah Zawahreh on 7/22/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
        let weatherData: [(day: String, icon: String, temp: Int)] = [
            ("TUE", "cloud.sun.fill", 72),
            ("WED", "sun.haze.fill", 74),
            ("THU", "sun.rain.fill", 68),
            ("FRI", "sun.max.trianglebadge.exclamationmark", 91),
            ("SAT", "sun.max.fill", 85)
        ]


    
    var body: some View {
    
        ZStack{
            BackgroundGradientView(isNight: $isNight)
            
            VStack{
        
                CityDisplayView(city: "Worcester, MA")
            
                MainIconAndTempView(image: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 70)
                
                HStack(spacing: 20) {
                    
                    ForEach(weatherData, id: \.day) { data in
                                    WeatherDayView(day: data.day, icon: data.icon, temp: data.temp)
                                }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButtonView(buttonText: "Change Day Time", background: .white, foreBackground: .blue)
                }

                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var day: String
    var icon: String
    var temp: Int
    
    var body: some View {
        VStack{
            Text(day)
                .font(.system(size: 22, weight: .medium, design: .default))
                .foregroundStyle(.white)
            
            Image(systemName: icon)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
            
            Text("\(temp)°")
                .font(.system(size: 30, weight: .medium, design: .default))
                .foregroundStyle(.white)
            
            
        }
    }
}

struct BackgroundGradientView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: isNight ? [Color.black, Color.gray] : [Color.blue, Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomLeading)
        .ignoresSafeArea()
    }
}

struct CityDisplayView: View {
    
    var city: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainIconAndTempView: View {
    
    var image: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundStyle(.white)
        }.padding(.bottom, 40)
    }
}


