import Foundation

class timeTest {
    func updateIsValid(updateTimeString: String) -> Bool? {
        
        
        
        let updateTimeString = "3:00pm"
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "h:mma"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "hh:mma"
        
        if let date = inputFormatter.date(from: updateTimeString) {
            let updateTime = outputFormatter.string(from: date)
            print(updateTime)
        } else {
            print("Invalid time format")
        }
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "hh:mma"
        let end = dateFormatter.string(from: currentDate)
        
        print(end) // Example output: "04:35p"
        
        dateFormatter.dateFormat = "MM/dd/yy hh:mma"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier: "America/Los_Angeles")
        
        //return false
        
        guard let startDate = dateFormatter.date(from: updateTimeString),
              let endDate = dateFormatter.date(from: end) else {
            print("Invalid date format")
            return nil
        }
        
        let differenceInSeconds = endDate.timeIntervalSince(startDate)
        
        let differenceInMinutes = Int(differenceInSeconds / 60)
        
        if differenceInMinutes <= 30 {
            return true
        } else {
            return false
        }
    }
}
    
    
    
    
    
    
//    
//    let currentDate = Date()
//    let dateFormatter = DateFormatter()
//
//    dateFormatter.dateFormat = "hh:mma"
//    let end = dateFormatter.string(from: currentDate)
//    
//    print(start)
//    print(end)
//    
//    dateFormatter.dateFormat = "MM/dd/yy hh:mma"
//    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//    dateFormatter.timeZone = TimeZone(identifier: "America/Los_Angeles")
//    
//    guard let startDate = dateFormatter.date(from: start),
//          let endDate = dateFormatter.date(from: end) else {
//        print("Invalid date format")
//        return nil
//    }
//    
//    let differenceInSeconds = endDate.timeIntervalSince(startDate)
//    
//    let differenceInMinutes = Int(differenceInSeconds / 60)
//    
//    if differenceInMinutes <= 30 {
//        return true
//    } else {
//        return false
//    }


//func updateIsValid(start: String) -> Bool? {
//    
//    let currentDate = Date()
//    let dateFormatter = DateFormatter()
//
//    dateFormatter.dateFormat = "hh:mma"
//    let end = dateFormatter.string(from: currentDate)
//
//    print(end) // Example output: "04:35p"
//    
//    dateFormatter.dateFormat = "MM/dd/yy hh:mma"
//    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//    dateFormatter.timeZone = TimeZone(identifier: "America/Los_Angeles")
//    
//    guard let startDate = dateFormatter.date(from: start),
//          let endDate = dateFormatter.date(from: end) else {
//        print("Invalid date format")
//        return nil
//    }
//    
//    let differenceInSeconds = endDate.timeIntervalSince(startDate)
//    
//    let differenceInMinutes = Int(differenceInSeconds / 60)
//    
//    if differenceInMinutes <= 30 {
//        return true
//    } else {
//        return false
//    }
//}
