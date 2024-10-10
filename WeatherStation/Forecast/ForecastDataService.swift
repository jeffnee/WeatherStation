//
//  api.swift
//  TestProj
//
//  Created by Jeff Neely on 9/13/24.
//

import Foundation

class ForecastAPI {
    private let apiUrl = "https://api.weather.com/v3/wx/forecast/daily/5day?postalKey=93108:US&units=e&language=en-US&format=json&apiKey=be98b4148d7443ca98b4148d7473cac2"
    
    func fetchForecastData(completion: @escaping (Daypart?) -> Void) {
        guard let url = URL(string: apiUrl) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching weather data: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data returned")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let forecastData = try decoder.decode(ForecastData.self, from: data)
                let daypart = forecastData.daypart?.first
                completion(daypart)
                print(forecastData)
            } catch {
                print("Error decoding data: \(error)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}


