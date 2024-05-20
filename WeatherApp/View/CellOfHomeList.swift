//
//  CellOfHomeList.swift
//  WeatherApp
//
//  Created by Anas Salah on 16/05/2024.
//

import SwiftUI

struct CellOfHomeList: View {
    let day: String
    let temperature: Double
    let onTap: () -> Void

    var body: some View {
        HStack {
            Button(action: {
                onTap()
            }) {
                HStack{
                    Text(convertDateString(day))
                    Spacer()
                    Text("☁️")
                    Spacer()
                    Text(String(format: "%.2f", temperature))
                }
            }
        }
        .shadow(radius: 2)
        .padding()
        .background(Color.clear)
    }
    
    private func convertDateString(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: dateString) else {
            return "Unknown"
        }
        
        let today = Date()
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            print("Date \(dateString) is identified as Today.")
            return "Today"
        } else if calendar.isDate(date, equalTo: today, toGranularity: .day) {
            print("Date \(dateString) is identified as Today.")
            return "Today"
        } else {
            dateFormatter.dateFormat = "EEE"
            let dayOfWeek = dateFormatter.string(from: date)
            print("Date \(dateString) is identified as \(dayOfWeek).")
            return dayOfWeek
        }
    }

}

#Preview {
    CellOfHomeList(day: "2024-05-19", temperature: 0.0, onTap: {})
}


