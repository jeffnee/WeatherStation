//
//  api.swift
//  TestProjq
//
//  Created by Jeff Neely on 9/13/24.
//

import Foundation

class ForecastAPI {

    let zipCode: String
    
    init(zipCode: String) {
        self.zipCode = zipCode
    }
    
    private var forecastUrl: String {
        print("------------->\(zipCode)<------------")
        return "https://api.weather.com/v3/wx/forecast/daily/5day?postalKey=\(zipCode):US&units=e&language=en-US&format=json&apiKey=be98b4148d7443ca98b4148d7473cac2"
    }
    
    func getForecastData(completion: @escaping (Daypart?) -> Void) {
        guard let url = URL(string: forecastUrl) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching forecast data: \(error)")
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
                print(data)
                completion(daypart)
            } catch {
                print("Error decoding data: \(error)")
                completion(nil)
           }
        }
        
        task.resume()
    }
}


