//
//  RainView2.swift
//  WeatherStation
//
//  Created by Jeff Neely on 12/12/24.
//


import SwiftUI

struct RainView2: View {
    var wthr: Weather
    
    var body: some View {
        VStack(alignment: .leading) {
            divider()
            weatherHeader2(title: "Rain", icon: "cloud.rain")
            
            VStack(alignment: .leading){
                Text("Todays rain \(wthr.rainToday)")
                    .bold()
                Text("Storm \(wthr.rainStorm)")
                Text("This months total \(wthr.rainMonth)")
                Text("This season total \(wthr.rainSeason)")
                Text("Current rate \(wthr.rainRate)")
                
                let graphUrl = "https://thedriveweather.com/images/RainHistory.gif?v=1724625810"
                ShowGraphImage(graphUrl: graphUrl)
            }
            .font(.system(size: 25))
            .padding(.leading, 35)
            .padding(.bottom,25)
        }
    }
}
