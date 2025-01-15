//


import Foundation

class Formats: ObservableObject {
    
    func formatTime(_ time: String) -> String {
        var formattedTime = time.replacingOccurrences(of: "a", with: " AM")
        formattedTime = formattedTime.replacingOccurrences(of: "p", with: " PM")
        
        return formattedTime
    }
}

