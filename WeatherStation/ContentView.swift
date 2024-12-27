//
//  ContentView.swift
//
//  Created by Jeff Neely on 7/27/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        TabView{
            WeatherView()
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Home")}
                    }
            
//            WeatherView2()
//                .tabItem {
//                    VStack{
//                        Image(systemName: "house")
//                        Text("Home 2")}
//                    }
            TideGraphView()
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Home 2")}
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
