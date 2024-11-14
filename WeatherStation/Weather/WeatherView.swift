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
                
                ScrollView{
                    ForEach (weather, id: \.self) { i in
                        Text("Last update \(i.time)  \(i.date)")
                            .font(.headline.bold())
                        
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

