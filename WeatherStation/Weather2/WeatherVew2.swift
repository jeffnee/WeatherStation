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

    var body: some View {
        ZStack {
            SetBackground()
            
            ScrollView{
                VStack{
                    screenHeader()
                    
                    if let first = weather.first {
                        Text("Last updated \(formatter.formatTime(first.time)) \(first.date)")
                    }
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
    WeatherView2()
}



struct screenHeader: View {
    var body: some View {
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
                .cornerRadius(10)
        }
    }
}
