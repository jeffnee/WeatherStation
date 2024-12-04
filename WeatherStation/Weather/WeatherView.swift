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
           
            VStack{
                Text ("Jeffs weather station")
                    .font(.largeTitle)
               
                Text("Located at 200 E Mountain Dr")
                    .font(.title3)
                
                Text("Santa Barbra, Ca")
                    .font(.title3)
                
                //let t = isWithinThirtyMinutes(date: "12/03/24", time: "11:25a")
                
                Text("valid")
                    .background(isWithinThirtyMinutes(date: "12/04/24",
                                                      time: "03:02p") ? Color.green : Color.red)            
                            
                if let first = weather.first {
                    Text("Last update \(first.time) \(first.date)")
                            .font(.headline.bold())
                }
        
                
                
                ScrollView{
                    ForEach (weather, id: \.self) { i in
                       
                        VStack {
                            TempsView(wthr: i)
                            WindView(wthr: i)
                            RainView(wthr: i)
                            HumidView(wthr: i)
                        }
                    }
                    .task {
                        await fetchData()
                    }
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

struct validateUpdate: View {
    var weather: Weather
    
    var body: some View {
        
        Text("validate")
    }
}
