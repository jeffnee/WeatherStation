//
//  HumidView.swift
//  breakiingBad
//
//  Created by Jeff Neely on 8/25/24.
//

import SwiftUI

struct HumidView: View {
    var wthr: Weather
    var body: some View {
        VStack(alignment: .leading) {
            weatherHeader(title: "Humidity", icon: "humidity.fill")

            VStack(alignment: .leading) {
                Text("Currently \(wthr.humidCurr)")
                    .font(.system(size: 20).bold())
                Text("Todays high \(wthr.humidHigh) at \(wthr.humidHighTime)")
                Text("Todays low \(wthr.humidLow) at \(wthr.humidLowTime)")
                
                let graphUrl = "https://thedriveweather.com/images/OutsideHumidityHistory.gif?v=1724635707"
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

