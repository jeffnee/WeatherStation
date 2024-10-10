//
//  ContentView.swift
//  breakiingBad
//
//  Created by Jeff Neely on 7/27/24.
//

import SwiftUI

struct ContentView: View {

    @State var fName: String = "temperature"

    var body: some View {

        TabView{
            WeatherView()
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Home")}

                    }
           ForecastView()
                .tabItem {
                    VStack{
                        Image(systemName: "calendar.badge.clock")
                        Text("Forecast")}

                    }
            AboutView()
                .tabItem {
                    VStack{
                        Image(systemName: "info.circle")
                        Text("About")
                    }
                }
        }
    }
}
#Preview {
    ContentView()
}
