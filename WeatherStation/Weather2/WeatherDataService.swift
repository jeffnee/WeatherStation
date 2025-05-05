//
//  wviw.swift
//  WeatherStation
//
//  Created by Jeff Neely on 4/9/25.
//

import Foundation

//class WeatherAPI {
//    func getWeatherData(completion: @escaping ([WeatherD]) -> Void) {
//        guard let url = URL(string: "https://jeffstestspace.a2hosted.com/api") else {
//            print("Invalid URL")
//            completion([])
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error fetching weather data: \(error)")
//                completion([])
//                return
//            }
//
//            guard let data = data else {
//                print("No data received")
//                completion([])
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let weatherData = try decoder.decode([WeatherD].self, from: data)
//                completion(weatherData)
//            } catch {
//                print("Error decoding weather data: \(error)")
//                completion([])
//            }
//        }
//        
//        task.resume()
//    }
//}
///////////////////////////////////////////////////////
class WeatherAPI {
    func getWeatherData(completion: @escaping ([WeatherD]) -> Void) {
        guard let url = URL(string: "https://jeffstestspace.a2hosted.com/api") else {
            print("Invalid URL")
            completion([])
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching weather data: \(error)")
                completion([])
                return
            }

            guard let data = data else {
                print("No data received")
                completion([])
                return
            }

            do {
                let decoder = JSONDecoder()
                let weatherItem = try decoder.decode(WeatherD.self, from: data)
                completion([weatherItem]) // wrap it in an array to keep your view code unchanged
            } catch {
                print("Error decoding weather data: \(error)")
                completion([])
            }
        }

        task.resume()
    }
}

