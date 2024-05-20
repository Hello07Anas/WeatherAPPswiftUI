//
//  ContentView.swift
//  WeatherApp
//
//  Created by Anas Salah on 16/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    @State private var weatherResponse: WeatherResponse?

    @State private var backgroundColor = Color.clear
    @State private var fontColor: Color = .black
    @State private var backgroundImageName: String = "Day"
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.cityName ?? "City")
                    .foregroundColor(fontColor)
                    .font(.system(size: 48))
                Text("\(viewModel.weatherResponse?.current.tempC ?? 0)°")
                    .foregroundColor(fontColor)
                    .font(.system(size: 40))
                Text(viewModel.weatherResponse?.current.condition.text ?? "")
                    .foregroundColor(fontColor)
                    .font(.system(size: 32))
                
                HStack {
                    Text("H: \(viewModel.weatherResponse?.current.tempC ?? 0)°")
                        .foregroundColor(fontColor)
                    Text("      ")
                    Text("L: \(viewModel.weatherResponse?.current.tempC ?? 0)°")
                        .foregroundColor(fontColor)
                }
                
                Text("⛅️")
                    .font(.system(size: 50))
                    .shadow(radius: 10)

                ListOfHome()
                
                LazyVGrid(columns: columns, spacing: 16) {
                    WeatherDetailRow(title: "Visibility", value: "\(viewModel.weatherResponse?.current.visKM ?? 0) KM", fontColor: fontColor)
                    WeatherDetailRow(title: "Humidity", value: "\(viewModel.weatherResponse?.current.humidity ?? 0)%", fontColor: fontColor)
                    WeatherDetailRow(title: "Feels Like", value: "\(viewModel.weatherResponse?.current.feelslikeC ?? 0)°", fontColor: fontColor)
                    WeatherDetailRow(title: "Pressure", value: "\(viewModel.weatherResponse?.current.pressureMB ?? 0) MB", fontColor: fontColor)
                }
                .padding()
            }
            .background(
                Image(backgroundImageName)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            ).onAppear {
                setAppearance()
                viewModel.fetchWeather()
            }
            .padding()
        }
    }
    
    func setAppearance() {
        let currentDate = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDate)
        
        if hour >= 5 && hour < 18 {
            backgroundColor = Color.white
            fontColor = .black
            backgroundImageName = "Day"
        } else {
            backgroundColor = Color.black
            fontColor = .white
            backgroundImageName = "Night"
        }
    }
}

struct WeatherDetailRow: View {
    let title: String
    let value: String
    let fontColor: Color
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(fontColor)
            Text(value)
                .font(.title)
                .foregroundColor(fontColor)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
