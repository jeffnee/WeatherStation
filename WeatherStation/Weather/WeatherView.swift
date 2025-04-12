////
////  WeatherView.swift
////  WeatherStation
////
////  Created by Jeff Neely on 9/1/24.
////
//
//import SwiftUI
//
//struct WeatherView: View {
//    
//    @State private var weather = [WeatherD]()
//    @StateObject private var formatter = Formats()
//    //let weatherService = WeatherDataService()
//    
//    var body: some View {
//        ZStack {
//            SetBackground()
//            let time1:String = weather.first?.time ?? "n/a"
//            let upDate:String = weather.first?.date ?? "n/a"
//            let upTime = formatter.formatTime(time1)
//            
//            ScrollView{
//                VStack{
//                    ForEach (weather, id: \.self) {i in
//                        VStack{
//                            screenHeader()
//                            Text("Last updated:")
//                            Text(" \(upTime) \(upDate)")
//                            
//                            TempsView(wthr: i)
//                            WindView(wthr: i)
//                            RainView(wthr: i)
//                            HumidView(wthr: i)
//                        }
//                        .padding()
//                    }
//                }
//                .onAppear {
////                    //weatherService.fetchWeatherData { weather in
////                        if let weather = weather {
////                            print(weather)
////                        } else {
//                            print("error getting weather")
//                        }
//                        
//                    }
//                }
//                
//            }
//        }
//        
//    }
        
    //}
    
        //fetchWeatherData { weather in
        //    if let weatherData = weatherData {
        //        print("Current temperature: \(weatherData.tempCurr)")
        //    } else {
        //        print("Failed to load weather data")
        //    }}
