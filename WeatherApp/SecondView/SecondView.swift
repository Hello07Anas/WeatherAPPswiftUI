//
//  SecondView.swift
//  WeatherApp
//
//  Created by Anas Salah on 18/05/2024.


import SwiftUI

struct SecondView: View {
    let hourlyTemperatures: [Hour]
    
    @State private var backgroundColor = Color.clear
    @State private var fontColor: Color = .black
    @State private var backgroundImageName: String = "Day"
    
    var body: some View {
        List {
            ForEach(hourlyTemperatures.indices, id: \.self) { index in
                let hour = hourlyTemperatures[index]
                let hourString = formatHour(hour.time, atIndex: index)

                HStack {
                    Text(hourString)
                        .foregroundColor(fontColor)                     
                    Spacer()
                    Text("⛅️")
                    //Text(hour.condition.icon)
                    Spacer()
                    Text(String(format: "%.2f°", hour.tempC))
                        .foregroundColor(fontColor)
                }
                .padding()
                .listRowBackground(Color.clear)
            }
        }
        .background(Color.clear)
        .scrollContentBackground(.hidden)
        .background(
            Image(backgroundImageName)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        ).onAppear {
            setAppearance()
        }
        .padding()
    }

    func formatHour(_ time: String, atIndex index: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        if let date = dateFormatter.date(from: time) {
            let currentDate = Date()
            let calendar = Calendar.current
            if calendar.isDate(date, inSameDayAs: currentDate) {
                let hourFormatter = DateFormatter()
                hourFormatter.dateFormat = "hh a"
                let currentHour = Int(hourFormatter.string(from: currentDate)) ?? 0
                let hour = currentHour + index
                if index == 0 {
                    return "Now"
                } else {
                    return "\(hour % 12 == 0 ? 12 : hour % 12):00 \(hour < 12 ? "AM" : "PM")"
                }
            } else {
                let hourFormatter = DateFormatter()
                hourFormatter.dateFormat = "hh:mm a"
                return hourFormatter.string(from: date)
            }
        }
        return time
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

#Preview {
    SecondView(hourlyTemperatures: [])
}
