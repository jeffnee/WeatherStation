//import SwiftUI
//
//struct ForecastView: View {
//    @State private var daypart: Daypart?
//    @State private var scrollToTopID = UUID() // Unique ID to reset scroll position
//
//    var body: some View {
//        ZStack {
//            SetBackground()
//            VStack {
//                Text("Local Forecast")
//                    .font(.largeTitle)
//
//                Text("Santa Barbara area")
//
//                divider()
//
//                if let daypart = daypart {
//                    ScrollViewReader { proxy in
//                        ScrollView {
//                            VStack(alignment: .leading) {
//                                // Assign ID for the top element
//                                Text("Forecast Details")
//                                    .id(scrollToTopID)
//                                    .font(.headline)
//
//                                ForEach(0..<(daypart.dayOrNight?.count ?? 0), id: \.self) { index in
//                                    if daypart.dayOrNight?[index] != nil {
//                                        VStack(alignment: .leading) {
//                                            Text("\(daypart.daypartName?[index] ?? "N/A")")
//                                                .font(.title)
//                                                .bold()
//
//                                            ForecastDetailView(daypart: daypart, index: index)
//
//                                            Text("\(daypart.narrative?[index] ?? "N/A")")
//
//                                            divider()
//                                        }
//                                    }
//                                }
//                                .padding(.bottom, 14.0)
//                            }
//                        }
//                        .padding(20)
//                        .onAppear {
//                            // Scroll to the top when data is refreshed
//                            withAnimation {
//                                proxy.scrollTo(scrollToTopID, anchor: .top)
//                            }
//                        }
//                    }
//                } else {
//                    Text("Loading weather data...")
//                }
//            }
//        }
//        .onAppear {
//            fetchWeatherData()
//        }
//    }
//
//    private func fetchWeatherData() {
//        // Trigger API call to refresh data
//        ForecastAPI().fetchForecastData { fetchedDaypart in
//            DispatchQueue.main.async {
//                self.daypart = fetchedDaypart
//                self.scrollToTopID = UUID() // Reset scroll position identifier
//            }
//        }
//    }
//}
//
//#Preview {
//    ForecastView()
//}
//
//struct SetBackground: View {
//    var body: some View {
//        LinearGradient(
//            gradient: Gradient(colors: [
//                Color.blue.opacity(0.8),
//                Color.blue.opacity(0.3)
//            ]),
//            startPoint: .top,
//            endPoint: .bottom
//        )
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct divider: View {
//    var body: some View {
//        Divider()
//            .frame(height: 0.7)
//            .background(Color.primary)
//            .padding(.horizontal)
//            .padding(.top)
//    }
//}
//
////import SwiftUI
////
////struct ForecastView: View {
////    @State private var daypart: Daypart?
////    
////    var body: some View {
////        ZStack{
////            SetBackground()
////            VStack{
////                Text("Local Forcast")
////                    .font(.largeTitle)
////                
////                Text("Santa Barbara area")
////                
////                divider()
////                    
////            if let daypart = daypart {
////                ScrollView{
////                    VStack(alignment:.leading) {
////                        ForEach(0..<(daypart.dayOrNight?.count ?? 0), id: \.self) { index in
////                            if daypart.dayOrNight?[index] != nil{
////                                VStack(alignment: .leading) {
////                                    Text("\(daypart.daypartName?[index] ?? "N/A")")
////                                        .font(.title)
////                                        .bold()
////
////                                    ForecastDetailView(daypart: daypart, index: index)
////
////                                    Text("\(daypart.narrative?[index] ?? "N/A")")
////                                   
////                                    divider()
////                                }
////                            }
////                        }
////                        .padding(.bottom, 14.0)
////                    }
////                }
////                .padding(20)
////            } else {
////                Text("Loading weather data...")
////                    .onAppear {
////                        ForecastAPI().fetchForecastData { fetchedDaypart in
////                            DispatchQueue.main.async {
////                                self.daypart = fetchedDaypart
////                            }
////                        }
////                    }
////                }
////            }
////        }
////    }
////}
////
////
////#Preview{
////    ForecastView()
////}
////
////struct SetBackground: View {
////    var body: some View {
////        LinearGradient(
////            gradient: Gradient(colors: [
////                Color.blue.opacity(0.8),
////                Color.blue.opacity(0.3)
////            ]),
////            startPoint: .top,
////            endPoint: .bottom
////        )
////        .edgesIgnoringSafeArea(.all)
////    }
////}
////
////struct divider: View {
////    var body: some View {
////        Divider()
////            .frame(height: 0.7)
////            .background(Color.primary)
////            .padding(.horizontal)
////            .padding(.top)
////    }
////}
import SwiftUI

struct ForecastView: View {
    @State private var daypart: Daypart?
    @State private var scrollToTopID = UUID() // Unique ID to reset scroll position

    var body: some View {
        ZStack {
            SetBackground()
            VStack {
                
                Text("Local Forecast")
                    .font(.largeTitle)

                Text("Santa Barbara area")

                //divider()

                if let daypart = daypart {
                    ScrollViewReader { proxy in
                        ScrollView {
                            VStack(alignment: .leading) {
                                // Invisible element at the top for scrolling
                                Color.clear
                                    .frame(height: 0)
                                    .id(scrollToTopID)

                                ForEach(0..<(daypart.dayOrNight?.count ?? 0), id: \.self) { index in
                                    if daypart.dayOrNight?[index] != nil {
                                        VStack(alignment: .leading) {
                                            Text("\(daypart.daypartName?[index] ?? "N/A")")
                                                .font(.title)
                                                .bold()

                                            ForecastDetailView(daypart: daypart, index: index)

                                            Text("\(daypart.narrative?[index] ?? "N/A")")

                                            divider()
                                        }
                                    }
                                }
                                .padding(.bottom, 14.0)
                            }
                        }
                        .padding(20)
                        .onAppear {
                            // Scroll to the top when data is refreshed
                            withAnimation {
                                proxy.scrollTo(scrollToTopID, anchor: .top)
                            }
                        }
                    }
                } else {
                    Text("Loading weather data...")
                }
            }
        }
        .onAppear {
            fetchWeatherData()
        }
    }

    private func fetchWeatherData() {
        // Trigger API call to refresh data
        ForecastAPI().fetchForecastData { fetchedDaypart in
            DispatchQueue.main.async {
                self.daypart = fetchedDaypart
                self.scrollToTopID = UUID() // Reset scroll position identifier
            }
        }
    }
}

#Preview {
    ForecastView()
}

struct SetBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.blue.opacity(0.8),
                Color.blue.opacity(0.3)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct divider: View {
    var body: some View {
        Divider()
            .frame(height: 0.7)
            .background(Color.primary)
            .padding(.horizontal)
            .padding(.top)
    }
}
