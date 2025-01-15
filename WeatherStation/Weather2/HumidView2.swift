//
//  HumidView2.swift
//  WeatherStation
//
//  Created by Jeff Neely on 12/12/24.
//


import SwiftUI

struct HumidView2: View {
    var wthr: Weather
    @StateObject private var formatter = Formats()

    var body: some View {
        VStack(alignment: .leading) {
            divider()
            
            weatherHeader2(title: "Humidity", icon: "humidity.fill")
            
            VStack(alignment: .leading) {
                Text("Currently \(wthr.humidCurr)")
                    .bold()
                Text("Todays high \(wthr.humidHigh) at \(formatter.formatTime(wthr.humidHighTime))")
                Text("Todays low \(wthr.humidLow) at \(formatter.formatTime(wthr.humidLowTime))")
                
                let graphUrl = "https://thedriveweather.com/images/OutsideHumidityHistory.gif?v=1724635707"
                ShowGraphImage(graphUrl: graphUrl)
            }
            .font(.system(size: 25))
            .padding(.leading, 35)
            .padding(.bottom,25)
        }
    }
}

