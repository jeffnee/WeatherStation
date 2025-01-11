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
            screenHeader()
            
            ScrollView{
                VStack{
                    Text ("Jeffs weather station")
                        .font(.title)
                    
                    Text("Located at 200 E Mountain Dr")
                        .font(.title3)
                    
                    Text("Santa Barbra, Ca")
                        .font(.title3)
                    
                    Image("ftn02")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .cornerRadius(13)
                    
                    if let first = weather.first {
                        Text("Last updated \(formatter.formatTime(first.time)) \(first.date)")
                    }
                 
                    ForEach (weather, id: \.self) { i in
                        
                        VStack {
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
