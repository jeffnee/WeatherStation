
import SwiftUI

struct ForecastView: View {
    @State private var daypart: Daypart?
    @State private var location:LocationResponse?
    
    
    @State private var scrollToTopID = UUID()

    var body: some View {
        ZStack {
            SetBackground()
            VStack {
                Text("Local Forecast")
                    .font(.largeTitle)
                Text("Santa Barbara area")
                
                    
                if let daypart = daypart {
                    ScrollViewReader { proxy in
                        ScrollView {
                            VStack(alignment: .leading) {
                               
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
            fetchForecastData()
            fetchLocationData()
        }
    }

    private func fetchForecastData() {
        // Trigger API call to refresh data
        ForecastAPI(zipCode: "93108").getForecastData { fetchedDaypart in
            DispatchQueue.main.async {
                self.daypart = fetchedDaypart
                self.scrollToTopID = UUID()
            }
        }
    }
    
    private func fetchLocationData() {
       LocationAPI(zipCode: "93108").getLocationtData { fetchedLocation in
            DispatchQueue.main.async {
                self.location = fetchedLocation
                self.scrollToTopID = UUID()
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
