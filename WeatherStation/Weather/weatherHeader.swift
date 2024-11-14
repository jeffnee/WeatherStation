//
//  weatherHeader.swift
//  WeatherStation
//
//  Created by Jeff Neely on 11/1/24.
//
import SwiftUI

struct weatherHeader: View {
    
    var title: String
    var icon: String

    var body: some View {
        
        HStack(alignment: .top) {
            Text("\(title)")
            Image(systemName: "\(icon)")
        }
        .font(.title)
        .frame(maxWidth:.infinity)
        .padding(.top, 8)
        .padding(.bottom, 8)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
}
