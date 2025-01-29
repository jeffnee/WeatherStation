 
//
//  WeatherVew2.swift
//  WeatherStation
//
//  Created by Jeff Neely on 12/8/24.
//


import SwiftUI

struct WeatherView2: View {
    
    @State private var weather = [Weather]()
    @StateObject private var formatter = Formats()
    @State private var timer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()

    var body: some View {
        
        let lastUpdateDate:String = weather.first?.date ?? "n/a"
        
        let lastUpdateTime = formatter.formatTime( weather.first?.time ?? "n/a")
        let timeIsRecent = formatter.isWithinThirtyMinutes(date: lastUpdateDate, time: lastUpdateTime)
        ZStack {
            SetBackground()
            
           
            
            ScrollView{
                VStack{
                    screenHeader()
                    Text("Last update:")
                        .foregroundColor( timeIsRecent ?  .primary : .red)
                    
                    Text(" \(lastUpdateTime) \(lastUpdateDate)")
                        .foregroundColor( timeIsRecent ?  .primary : .red)
                    
                    ForEach (weather, id: \.self) { i in
                        VStack {
                            TempsView2(wthr: i)
                            WindView2(wthr: i)
                            RainView2(wthr: i)
                            HumidView2(wthr: i)
                        }
                        .padding()
                        
                    }
                }
            }
        }
        .onAppear {
            Task {
                await fetchData()
            }
        }
        .onReceive(timer) { _ in
            Task {
                await fetchData()
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
    WeatherView2()
}

struct screenHeader: View {
    var body: some View {
        
        VStack{
            Text ("Jeffs weather station")
                .font(.title)
            
            Text("Located at 200 E Mountain Dr")
                .font(.title3)
            
            Text("Santa Barbara, Ca")
                .font(.title3)
            
            Image("ftn02")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .cornerRadius(13)
        }
    }
}

