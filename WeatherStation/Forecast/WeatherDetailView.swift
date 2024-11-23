//
//  WeatherDetailView.swift
//  WeatherStation
//
//  Created by Jeff Neely on 11/21/24.
//


import SwiftUI

struct WeatherDetailView: View {
    let daypart: Daypart // Replace `Daypart` with the actual type of `daypart`
    let index: Int       // Pass the index for the data

    var body: some View {
        HStack {
            Text("\(daypart.temperature?[index]?.description ?? "N/A")°")
                .font(.title)
                .bold()
                .foregroundColor(daypart.dayOrNight?[index] == "D" ? .yellow : .primary)
            
            if let iconCode = daypart.iconCode?[index] {
                Image("\(iconCode)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
            } else {
                Text("N/A")
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Wind \(daypart.windSpeed?[index]?.description ?? "N/A")")
                        .bold()
                    
                    Text("\(daypart.windDirectionCardinal?[index] ?? "N/A")")
                        .bold()
                }
                HStack {
                    let precipChance = (daypart.precipChance?[index] ?? 0) < 10 ? 0 : daypart.precipChance?[index] ?? 0
                    Text("Rain \(precipChance)%")
                        .bold()
                }
                HStack {
                    if let qpfValue = daypart.qpf?[index], qpfValue > 0 {
                        Text("Amount \(qpfValue.description)")
                            .bold()
                    }
                }
            }
        }
        .padding(.top, -10.0)
    }
}
