//
//  windView.swift
//  breakiingBad
//
//  Created by Jeff Neely on 8/19/24.
//

import SwiftUI

struct WindView: View {
    var wthr: Weather
    
    var body: some View {
        VStack(alignment: .leading) {
            weatherHeader(title: "Wind", icon: "wind")
            
            VStack(alignment:.leading){
                Text("Currently \(wthr.windCurr)  \(wthr.windDir)")
                    .font(.system(size: 20).bold())
                Text("Todays high \(wthr.windHigh) at \(wthr.windHighTime)")
                Text("Months high \(wthr.windMonthHigh)")
                Text("Years high \(wthr.windYearHigh)")
                
                let graphUrl = "https://thedriveweather.com/images/HiWindSpeedHistory.gif?v=1724625500"
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

