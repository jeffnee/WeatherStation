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
            HStack(alignment: .top) {
                Text("Humidity")
                Image(systemName: "humidity.fill")
            }
            .font(.system(size: 25))
            .frame(maxWidth:.infinity)
            .padding(.top, 8)
            .padding(.bottom, 8)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            
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

