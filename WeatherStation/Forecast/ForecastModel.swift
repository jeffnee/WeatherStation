import Foundation

struct Daypart: Codable {
    let dayOrNight: [String?]?
    let daypartName: [String?]?
    let iconCode: [Int?]?
    let narrative: [String?]?
    let precipChance: [Int?]?
    let qpf: [Double?]?
    let temperature: [Int?]?
    let windSpeed: [Int?]?
    let windDirectionCardinal: [String?]?
}

struct ForecastData: Codable {
    let daypart: [Daypart]?
}

//struct LocationData: Codable {
//   var zipCode: String
//    let city: String
//}

struct LocationResponse: Codable {
    let location: Location

    struct Location: Codable {
        let city: String
    }
}
