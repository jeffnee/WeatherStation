//
//  WeatherVew2.swift
//  WeatherStation
//
//  Created by Jeff Neely on 12/8/24.
//


import SwiftUI

struct WeatherView2: View {
    
    @State private var weather = [Weather]()
        
    var body: some View {
        ZStack {
            SetBackground()
           
            VStack{
                VStack{
                    Text ("Jeffs weather station")
                        .font(.largeTitle)
                    
                    Text("Located at 200 E Mountain Dr")
                        .font(.title3)
                    
                    Text("Santa Barbra, Ca")
                        .font(.title3)
                    
                    if let first = weather.first {
                        Text("Last update \(first.time) \(first.date)")
                            .font(.headline.bold())
                            
                    }
                }
                
                ScrollView{
                    ForEach (weather, id: \.self) { i in
                        VStack {
                            TempsView2(wthr: i)
                            WindView2(wthr: i)
                            RainView2(wthr: i)
                            HumidView2(wthr: i)
                        }
                        .padding()
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
    WeatherView2()
}


