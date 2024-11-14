//
//  rainView.swift
//  breakiingBad
//
//  Created by Jeff Neely on 8/19/24.
//

import SwiftUI

struct RainView: View {
    var wthr: Weather
    
    var body: some View {
    VStack(alignment: .leading) {
        weatherHeader(title: "Rain", icon: "cloud.rain")

        VStack(alignment: .leading){
                Text("Todays rain \(wthr.rainToday)")
                    .font(.system(size: 20).bold())
                Text("Storm \(wthr.rainStorm)")
                Text("This months total \(wthr.rainMonth)")
                Text("This season total \(wthr.rainSeason)")
                Text("Current rate \(wthr.rainRate)")
            
                let graphUrl = "https://thedriveweather.com/images/RainHistory.gif?v=1724625810"
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
