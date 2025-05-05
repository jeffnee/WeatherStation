//
//  ContentView.swift
//
//  Created by Jeff Neely on 7/27/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        TabView{
            WeatherView2()
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
            
            ImagesView()
                .tabItem {
                    VStack{
                        Image(systemName: "photo")
                        Text("Images")}
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

