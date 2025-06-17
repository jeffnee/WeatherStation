//
//  ContentView.swift
//
//  Created by Jeff Neely on 7/27/24.
//


import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            WeatherView2()
                .id("tab-\(selectedTab == 0 ? UUID() : UUID())") // Recreates only when selected
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)

            ForecastViewZip()
                .id("tab-\(selectedTab == 1 ? UUID() : UUID())")
                .tabItem {
                    Label("Forecast", systemImage: "calendar.badge.clock")
                }
                .tag(1)

            ImagesView()
               // .id("tab-\(selectedTab == 2 ? UUID() : UUID())")
                .tabItem {
                    Label("Images", systemImage: "photo")
                }
               // .tag(2)

            AboutView()
                //.id("tab-\(selectedTab == 3 ? UUID() : UUID())")
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
               // .tag(3)
        }
    }
}
