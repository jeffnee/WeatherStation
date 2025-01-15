//
//  WindView2.swift
//  WeatherStation
//
//  Created by Jeff Neely on 12/10/24.
//


import SwiftUI

struct WindView2: View {
    var wthr: Weather
    @StateObject private var formatter = Formats()
    
    var body: some View {
        VStack(alignment: .leading) {
            divider()
            
            weatherHeader2(title: "Wind", icon: "wind")
            
            VStack(alignment:.leading){
                Text("Currently \(wthr.windCurr)  \(wthr.windDir)")
                    .bold()
                Text("Todays high \(wthr.windHigh) at \(formatter.formatTime(wthr.windHighTime))")
                Text("Months high \(wthr.windMonthHigh)")
                Text("Years high \(wthr.windYearHigh)")
                
                let graphUrl = "https://thedriveweather.com/images/HiWindSpeedHistory.gif?v=1724625500"
                ShowGraphImage(graphUrl: graphUrl)
            }
            .font(.system(size: 25))
            .padding(.leading, 35)
            .padding(.bottom,25)
        }
        //.font(.system(size: 20))
    }
}
