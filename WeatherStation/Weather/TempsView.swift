//
//  tempsView.swift
//  breakiingBad
//
//  Created by Jeff Neely on 8/19/24.
//

import SwiftUI

struct TempsView: View {
    var wthr: Weather
    var title: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text("\(title)")
                Image(systemName: "thermometer.medium")
            }
            .font(.title)
            .frame(maxWidth:.infinity)
            .padding(.top, 8)
            .padding(.bottom, 8)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            
            VStack(alignment: .leading) {
                Text("Currently \(wthr.tempCurr)")
                    .font(.system(size: 20).bold())
                Text("Todays high \(wthr.tempHigh) at \(wthr.tempHighTime)")
                Text("Todays low \(wthr.tempLow) at \(wthr.tempLowTime)")
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
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: 350, alignment: .leading)
        .foregroundColor(.black)
        .font(.system(size: 20))
        .background(Color.white)
        .cornerRadius(20)
        
    }
}
