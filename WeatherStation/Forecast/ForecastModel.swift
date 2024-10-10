import Foundation

struct Daypart: Codable {
    let dayOrNight: [String?]?
    let daypartName: [String?]?
    let iconCode: [Int?]?
    let narrative: [String?]?
    let precipChance: [Int?]?
    let temperature: [Int?]?
    let windSpeed: [Int?]?
    let windDirectionCardinal: [String?]?
}

struct ForecastData: Codable {
    let daypart: [Daypart]?
}


