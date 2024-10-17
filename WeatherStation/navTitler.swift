import SwiftUI

// MoonPhaseCalculator to calculate the current moon phase based on the number of days since a known new moon.
struct MoonPhaseCalculator {
    
    // Known new moon date: January 6, 2000 (as an example reference)
    static let referenceDate = Calendar.current.date(from: DateComponents(year: 2000, month: 1, day: 6))!
    
    static func calculateMoonPhase() -> String {
        let today = Date()
        let daysSinceNewMoon = Calendar.current.dateComponents([.day], from: referenceDate, to: today).day!
        
        // The moon cycle is approximately 29.53 days
        let moonCycle = 29.53
        let currentPhase = Double(daysSinceNewMoon).truncatingRemainder(dividingBy: moonCycle)
        
        switch currentPhase {
        case 0...1:
            return "New Moon"
        case 1...7:
            return "Waxing Crescent"
        case 7...10:
            return "First Quarter"
        case 10...15:
            return "Waxing Gibbous"
        case 15...16:
            return "Full Moon"
        case 16...22:
            return "Waning Gibbous"
        case 22...24:
            return "Last Quarter"
        case 24...29:
            return "Waning Crescent"
        default:
            return "Unknown Phase"
        }
    }
}

struct MoonPhaseView: View {
    @State private var currentMoonPhase: String = ""

    var body: some View {
        VStack {
            Text("Current Moon Phase")
                .font(.headline)
                .padding(.bottom, 5)
            
            Text(currentMoonPhase)
                .font(.largeTitle)
                .bold()
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
            
            Spacer()
        }
        .onAppear {
            currentMoonPhase = MoonPhaseCalculator.calculateMoonPhase()
        }
        .padding()
    }
}

struct MoonPhaseApp: App {
    var body: some Scene {
        WindowGroup {
            MoonPhaseView()
        }
    }
}

// Entry point
//@main
struct MoonPhaseApp_Previews: PreviewProvider {
    static var previews: some View {
        MoonPhaseView()
    }
}

