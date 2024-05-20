//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Anas Salah on 19/05/2024.
//

import Foundation
import Alamofire

class WeatherViewModel: ObservableObject {
    @Published var weatherResponse: WeatherResponse?
    @Published var cityName: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func fetchWeather() {
        isLoading = true
        print("Fetching weather data...")

        let url = "https://api.weatherapi.com/v1/forecast.json?key=e28ecca6437c4873b2c140547241605&q=30.2002050505,31.0202020505&days=3&aqi=no&alerts=no"

        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let data):
                do {
                    // Print the raw JSON data for debugging
                    if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted),
                       let jsonString = String(data: jsonData, encoding: .utf8) {
                        print("JSON Response: \(jsonString)")
                    }

                    let decoder = JSONDecoder()
                    let weather = try decoder.decode(WeatherResponse.self, from: response.data!)
                    print("Weather data fetched successfully.")
                    self.weatherResponse = weather
                    self.cityName = weather.location.name
                    self.isLoading = false
                } catch {
                    print("Failed to decode weather data:", error)
                    self.errorMessage = "Failed to decode weather data: \(error.localizedDescription)"
                    self.isLoading = false
                }
            case .failure(let error):
                print("Failed to fetch weather data:", error.localizedDescription)
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
}


