//
//  getlocation.swift
//  WeatherStation
//
//  Created by Jeff Neely on 6/12/25.
//

import Foundation

class LocationAPI{
    
    let zipCode: String
    
    init(zipCode: String) {
        self.zipCode = zipCode
    }
    
    private var locationUrl: String {
        print("---location----->\(zipCode)<------------")
        return "https://api.weather.com/v3/location/point?postalKey=\(zipCode):US&language=en-US&format=json&apiKey=be98b4148d7443ca98b4148d7473cac2"
       }
    
    
    func getLocationtData(completion: @escaping (LocationResponse?) -> Void) {
        guard let url = URL(string: locationUrl) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
                print("Error fetching Location data: \(error)")
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
                let locationData = try decoder.decode(LocationResponse.self, from: data)
                let location = locationData
                completion(location)
            } catch {
                print("Error decoding Location data: \(error)")
                completion(nil)
           }
        }
        
        task.resume()
    }
}

