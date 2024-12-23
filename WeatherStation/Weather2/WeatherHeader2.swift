//
//  WeatherHeader2.swift
//  WeatherStation
//
//  Created by Jeff Neely on 12/8/24.
//

import SwiftUI

struct weatherHeader2: View {
    
    var title: String
    var icon: String

    var body: some View {
        
        HStack(alignment: .top) {
            Image(systemName: "\(icon)")
            Text("\(title)")
        }
        .font(.title)
        .bold()

    }
}
