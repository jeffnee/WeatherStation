//
//  BarmView2.swift
//  WeatherStation
//
//  Created by Jeff Neely on 4/17/25.
//

import SwiftUI

struct BarView2: View {
    var wthr: WeatherD
    @StateObject private var formatter = Formats()

    var body: some View {
        VStack(alignment:.leading){

            weatherHeader2(title: "Barometer", icon: "barometer")
            //divider()
            VStack(alignment: .leading){
                Text("Currently \(wthr.barCurr)")
                    .bold()
                
                Text("Trend \(wthr.barTrend)")

                let graphUrl = "https://thedriveweather.com/images/BarometerHistory.gif"
                ShowGraphImage(graphUrl: graphUrl)
            }
            .font(.system(size: 25))
            .padding(.leading, 32)
            .padding(.bottom,15)
        }
    }
}
