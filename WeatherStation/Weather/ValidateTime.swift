import Foundation

func isWithinThirtyMinutes(date: String, time: String) -> Bool {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "mm/dd/yy hh:mmp"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // Use POSIX locale for consistent formatting
    
    let combinedDateTimeString = "\(date) \(time)"
    
    print("comb  \(combinedDateTimeString)")

    guard let targetDate = dateFormatter.date(from: combinedDateTimeString) else {
        print("Invalid date or time format")
        return false
    }
    
    print("target \(targetDate)")
    print()
    let currentDate = Date()
    
    print("curr= \(currentDate)")
    
    // Calculate the time difference in seconds
    let timeDifference = abs(targetDate.timeIntervalSince(currentDate))
    
    print("diff \(timeDifference/60)")
    
    // Check if the time difference is within 30 minutes (1800 seconds)
    //print(timeDifference)
    return timeDifference <= 1800
}

// Example usage
let dateInput = "12/03/24"  // MM/dd/yy format
let timeInput = "03:45PM"   // hh:mma format

let result = isWithinThirtyMinutes(date: dateInput, time: timeInput)


