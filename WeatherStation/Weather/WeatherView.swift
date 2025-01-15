//
//  WeatherView.swift
//  WeatherStation
//
//  Created by Jeff Neely on 9/1/24.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var weather = [Weather]()
    @StateObject private var formatter = Formats()

    var body: some View {
        ZStack {
            SetBackground()
            let time1:String = weather.first?.time ?? "n/a"
            let upDate:String = weather.first?.date ?? "n/a"
            let upTime = formatter.formatTime(time1)
            ScrollView{
                VStack{
                    ForEach (weather, id: \.self) {i in
                        VStack{
                            screenHeader()
                            Text("Lastupdated")
                            Text("\(upTime) \(upDate)")

                            TempsView(wthr: i)
                            WindView(wthr: i)
                            RainView(wthr: i)
                            HumidView(wthr: i)
                        }
                        .padding()
                    }
                }
                .task {
                     await fetchData()
                        
                    }
                }
               
            }
        }
        func fetchData() async {
            if let fetchedWeather = await WeatherDataService.fetchWeatherData() {
                weather = fetchedWeather
            }
        }
        
    }
    
    #Preview {
        WeatherView()
    }
