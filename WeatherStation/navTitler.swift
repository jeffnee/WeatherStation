//import SwiftUI
//import TinyMoon
//
//struct ContentView: View {
//    let moonPhaseCalculator = MoonPhaseCalculator()
//
//    var body: some View {
//        VStack {
//            Text("Current Moon Phase")
//                .font(.largeTitle)
//                .padding()
//
//            Text(currentMoonPhase())
//                .font(.title)
//                .padding()
//
//            Spacer()
//        }
//    }
//
//    func currentMoonPhase() -> String {
//        let today = Date()
//        let moonPhase = moonPhaseCalculator.phase(of: today)
//
//        switch moonPhase {
//        case .newMoon:
//            return "🌑 New Moon"
//        case .waxingCrescent:
//            return "🌒 Waxing Crescent"
//        case .firstQuarter:
//            return "🌓 First Quarter"
//        case .waxingGibbous:
//            return "🌔 Waxing Gibbous"
//        case .fullMoon:
//            return "🌕 Full Moon"
//        case .waningGibbous:
//            return "🌖 Waning Gibbous"
//        case .lastQuarter:
//            return "🌗 Last Quarter"
//        case .waningCrescent:
//            return "🌘 Waning Crescent"
//        }
//    }
//}
//
//@main
//struct MoonPhaseApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
//
