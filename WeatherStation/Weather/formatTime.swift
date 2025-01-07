//


import Foundation

class Formats: ObservableObject {
    
    func formatTime(_ time: String) -> String {
        var formattedTime = time.replacingOccurrences(of: "a", with: "am")
        formattedTime = formattedTime.replacingOccurrences(of: "p", with: "pm")
        
        return formattedTime
    }
}

