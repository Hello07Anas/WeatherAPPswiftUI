//
//  ListOfHome.swift
//  WeatherApp
//
//  Created by Anas Salah on 16/05/2024.
//

import SwiftUI

struct ListOfHome: View {
    @StateObject var viewModel = WeatherViewModel()
    @State private var selectedDayIndex: Int?

    var body: some View {
        List {
            Section(header: Text("3-DAY FORECAST")
                .font(.headline)
                .foregroundColor(.black)) {
                ForEach(viewModel.weatherResponse?.forecast.forecastday ?? [], id: \.date) { forecastday in
                    CellOfHomeList(day: forecastday.date, temperature: forecastday.day.avgtempC) {
                        selectedDayIndex = viewModel.weatherResponse?.forecast.forecastday.firstIndex(where: { $0.date == forecastday.date })
                    }
                }
            }
            .listRowBackground(Color.clear)
        }
        .background(Color.clear)
        .scrollContentBackground(.hidden)
        .background(
            NavigationLink(
                destination: SecondView(hourlyTemperatures: viewModel.weatherResponse?.forecast.forecastday[selectedDayIndex ?? 0].hour ?? []),
                isActive: Binding<Bool>(
                    get: { selectedDayIndex != nil },
                    set: { if !$0 { selectedDayIndex = nil } }
                )
            ) {
                EmptyView()
            }
            .hidden()
        )
        .onAppear {
            viewModel.fetchWeather()
        }
    }
}






#Preview {
    ListOfHome()
}



