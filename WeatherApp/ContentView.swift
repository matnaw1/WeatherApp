//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mati MacBook on 13/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatus(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: 0,
                                    imageName: "cloud.sun.fill",
                                    temperature: 74)
                    
                    WeatherDayView(dayOfWeek: 1,
                                    imageName: "sun.max.fill",
                                    temperature: 80)
                    
                    WeatherDayView(dayOfWeek: 2,
                                    imageName: "cloud.sun.rain.fill",
                                    temperature: 73)
                    
                    WeatherDayView(dayOfWeek: 3,
                                    imageName: "cloud.sun.rain.fill",
                                    temperature: 71)
                    
                    WeatherDayView(dayOfWeek: 4,
                                    imageName: "cloud.bolt.rain.fill",
                                    temperature: 68)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                   textColor: .blue,
                                   backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Weather day VStack
struct WeatherDayView: View {
    var dayOfWeek: Int
    var imageName: String
    var temperature: Int
    var days = ["MON", "TUE", "WED", "THU", "FRI"]
    
    var body: some View {
        VStack(spacing: 8) {
            Text("\(days[dayOfWeek])")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

//Background ZStack
struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

//City name VStack
struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

//Main weather VStack
struct MainWeatherStatus: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}



