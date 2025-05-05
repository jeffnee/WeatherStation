//

import Foundation

class Formats: ObservableObject {
    
    func formatTime(_ time: String) -> String {
        var formattedTime = time.replacingOccurrences(of: "a", with: " AM")
        formattedTime = formattedTime.replacingOccurrences(of: "p", with: " PM")
        return formattedTime
    }


    func isWithinThirtyMinutes(date: String, time: String) -> Bool {
        //print("📥 Input - Date: \(date), Time: \(time)")
        //let date = "01-22-25"
        // Create date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        // Format the input strings into a full date/time
        dateFormatter.dateFormat = "MM-dd-yy hh:mm a"
        let combinedDateTime = "\(date) \(time)"
        //print("🔄 Combined date and time string: \(combinedDateTime)")
        
        // Try to create Date object from the combined string
        guard let inputDate = dateFormatter.date(from: combinedDateTime) else {
            //print("❌ Failed to parse date: \(combinedDateTime)")
            return false
        }
        //print("✅ Successfully parsed date: \(inputDate)")
        
        // Get current time
        let currentDate = Date()
        //'print("⏰ Current time: \(currentDate)")
        
        // Calculate time difference in seconds
        let timeDifference = abs(currentDate.timeIntervalSince(inputDate))
        //print("⏱️ Time difference: \(timeDifference) seconds (\(timeDifference / 60) minutes)")
        
        let isWithin = timeDifference <= 1800
        //print(isWithin ? "✅ Within 30 minutes" : "❌ Not within 30 minutes")
        
        return isWithin
    }
 /*
    func delayExec(){ dispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
        print("delay")
        }
    }*/
}

