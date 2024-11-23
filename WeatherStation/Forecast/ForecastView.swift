import SwiftUI

struct ForecastView: View {
    @State private var daypart: Daypart?
    
    var body: some View {
        ZStack{
            SetBackground()
            VStack{
                Text("Local Forcast")
                    .font(.largeTitle)
                
                Text("Santa Barbara area")
                
                divider()
                    
            if let daypart = daypart {
                ScrollView{
                    VStack(alignment:.leading) {
                        ForEach(0..<(daypart.dayOrNight?.count ?? 0), id: \.self) { index in
                            if daypart.dayOrNight?[index] != nil{
                                VStack(alignment: .leading) {
                                    Text("\(daypart.daypartName?[index] ?? "N/A")")
                                        .font(.title)
                                        .bold()

                                    WeatherDetailView(daypart: daypart, index: index)

                                    Text("\(daypart.narrative?[index] ?? "N/A")")
                                   
                                    divider()
                                }
                            }
                        }
                        .padding(.bottom, 14.0)
                    }
                }
                .padding(20)
            } else {
                Text("Loading weather data...")
                    .onAppear {
                        ForecastAPI().fetchForecastData { fetchedDaypart in
                            DispatchQueue.main.async {
                                self.daypart = fetchedDaypart
                            }
                        }
                    }
                }
            }
        }
    }
}


#Preview{
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
