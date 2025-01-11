//
//  WeatherDataService.swift
//  WeatherStation
//
//  Created by Jeff Neely on 9/6/24.
//

import Foundation

struct WeatherDataService {
    static func fetchWeatherData() async -> [Weather]? {
        guard let url = URL(string: "https://thedriveweather.com/api") else {
            print("Bad URL")
            return nil
        }

        do {
            let (data, error) = try await URLSession.shared.data(from: url)

            //print("Data received: \(data)")

            if let decodeResponse = try? JSONDecoder().decode([Weather].self, from: data) {
                return decodeResponse
            } else {
                print("Failed to decode response: \(error.debugDescription)")
            }
        } catch {
            print("Request failed with error: \(error.localizedDescription)")
        }
        return nil
    }
}
