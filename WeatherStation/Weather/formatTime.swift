//

import Foundation

class Formats: ObservableObject {
    
    func formatTime(_ time: String) -> String {
        var formattedTime = time.replacingOccurrences(of: "a", with: " AM")
        formattedTime = formattedTime.replacingOccurrences(of: "p", with: " PM")
        return formattedTime
    }

    func timeIsOk(dateString: String, timeString: String) -> Bool {
       //let dateString = "01-25-2025"
        print("date->\(dateString) time-->\(timeString)")
        let dateFormatter = DateFormatter()
        
        print(type(of: dateString))
        
        dateFormatter.dateFormat = "mm-dd-yyyy hh:mm a"
        
        // Combine date and time strings
        let combinedString = "\(dateString) \(timeString)"
        print("combnd-->\(combinedString)")

        // Convert the combined string to a Date object
        guard let inputDate = dateFormatter.date(from: combinedString) else {
            print("Invalid date format")
            return false
        }
        
        // Get the current date and time
        let currentDate = Date()
        
        // Calculate the time interval between the current date and input date
        let timeInterval = currentDate.timeIntervalSince(inputDate)
        print("iterval-->\(timeInterval)")
        // Check if the time interval is within 30 minutes (1800 seconds)
        if timeInterval > 0 && timeInterval <= 1800 {
            return true
        } else {
            return false
        }
    }
}

