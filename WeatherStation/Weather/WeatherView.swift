//
//  WeatherView.swift
//  WeatherStation
//
//  Created by Jeff Neely on 9/1/24.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var weather = [Weather]()
        
    var body: some View {
        ZStack {
            SetBackground()
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
                    .cornerRadius(10)
                            
                if let first = weather.first {
                    Text("Last update \(first.time) \(first.date)")
                            .font(.headline.bold())
                }
                Text(weather.first?.time ?? "0000")
                    ForEach (weather, id: \.self) { i in
                       
                        VStack {
                            TempsView(wthr: i)
                            WindView(wthr: i)
                            RainView(wthr: i)
                            HumidView(wthr: i)
                        }
                    }
                   
                }
            }
        }
        .task {
            await fetchData()
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

struct validateUpdate: View {
    var weather: Weather
    
    var body: some View {
        
        Text("validate")
    }
}
