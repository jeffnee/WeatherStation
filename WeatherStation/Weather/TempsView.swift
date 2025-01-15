//
//  tempsView.swift
//  breakiingBad
//
//  Created by Jeff Neely on 8/19/24.
//

import SwiftUI

struct TempsView: View {
    var wthr: Weather
    @StateObject private var formatter = Formats()
    
    var body: some View {
        VStack(alignment: .leading) {
            weatherHeader(title: "Temperature", icon: "thermometer.medium")
            
            VStack(alignment: .leading) {
                Text("Currently \(wthr.tempCurr)")
                    .font(.system(size: 25).bold())
                Text("Todays high \(wthr.tempHigh) at \(formatter.formatTime(wthr.tempHighTime))")
                Text("Todays low \(wthr.tempLow) at \(formatter.formatTime(wthr.tempLowTime))")
                Text("This Months high \(wthr.tempMonthHigh)")
                Text("This Years high \(wthr.tempYearHigh)")
                
                let graphUrl = "https://thedriveweather.com/images/OutsideTempHistory.gif?v=1724422106"
                ShowGraphImage(graphUrl: graphUrl)
            }
            .foregroundColor(.black)
            .font(.system(size: 20))
            .padding(.leading, 15)
            .padding(.bottom,15)
            .background(Color.white)
        }
        .frame(width: 350, alignment: .leading)
        .foregroundColor(.black)
        .font(.system(size: 20))
        .background(Color.white)
        .cornerRadius(20)
    }
}
