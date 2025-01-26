
import Foundation

func isWithinThirtyMinutes(dateString: String, timeString: String) -> Bool {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd hh:mm a"
    
    // Combine date and time strings
    let combinedString = "\(dateString) \(timeString)"
    
    // Convert the combined string to a Date object
    guard let inputDate = dateFormatter.date(from: combinedString) else {
        print("Invalid date format")
        return false
    }
    
    // Get the current date and time
    let currentDate = Date()
    
    // Calculate the time interval between the current date and input date
    let timeInterval = currentDate.timeIntervalSince(inputDate)
    
    // Check if the time interval is within 30 minutes (1800 seconds)
    if timeInterval > 0 && timeInterval <= 1800 {
        return true
    } else {
        return false
    }
}
