//
//  TempsView2.swift
//  WeatherStation
//
//  Created by Jeff Neely on 12/8/24.
//


import SwiftUI

struct TempsView2: View {
    var wthr: Weather
    @StateObject private var formatter = Formats()

    var body: some View {
        VStack(alignment:.leading){

            weatherHeader2(title: "Temperature", icon: "thermometer.medium")
            //divider()
            VStack(alignment: .leading){
                Text("Currently \(wthr.tempCurr)")
                     Text("Todays high \(wthr.tempHigh) at \(formatter.formatTime(wthr.tempHighTime))")
                Text("Todays low \(wthr.tempLow) at \(formatter.formatTime(wthr.tempLowTime))")
                Text("This Months high \(wthr.tempMonthHigh)")
                Text("This Months low  \(wthr.tempMonthLow)")
                Text("This Years high \(wthr.tempYearHigh)")
                Text("This Years low \(wthr.tempYearLow)")

                let graphUrl = "https://thedriveweather.com/images/OutsideTempHistory.gif?v=1724422106"
                ShowGraphImage(graphUrl: graphUrl)
            }
            .font(.system(size: 25))
            .padding(.leading, 32)
            .padding(.bottom,15)
        }
    }
}
