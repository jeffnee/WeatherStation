//
//  WeatherDataService.swift
//  WeatherStation
//
//  Created by Jeff Neely on 9/6/24.
///

import Foundation

class WeatherDataAPI {
    func fetchWeatherData(completion: @escaping (Weather?) -> Void) {
        guard let url = URL(string: "https://jeffstestspace.a2hosted.com/api") else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                completion(weather)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}
// Example usage
//fetchWeatherData { weatherData in
//    if let weatherData = weatherData {
//        print("Current temperature: \(weatherData.tempCurr)")
//    } else {
//        print("Failed to load weather data")
//    }
//}

