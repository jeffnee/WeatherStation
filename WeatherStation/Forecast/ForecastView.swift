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
                
                divide()
                    
            if let daypart = daypart {
                ScrollView{
                    VStack(alignment:.leading) {
                        ForEach(0..<(daypart.dayOrNight?.count ?? 0), id: \.self) { index in
                            if daypart.dayOrNight?[index] != nil{
                                VStack(alignment: .leading) {
                                    Text("\(daypart.daypartName?[index] ?? "N/A")")
                                        .font(.title)
                                        .bold()
                        
                                    HStack{
                                        Text("\(daypart.temperature?[index]?.description ?? "N/A")°")
                                            .font(.title)
                                            .bold()
                                            .foregroundColor(daypart.dayOrNight?[index] == "D" ? .red : .primary)

                                        
                                        if let iconCode = daypart.iconCode?[index] {
                                            Image("\(iconCode)")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 60, height: 60)
                                            
                                        } else {
                                            Text("N/A")
                                        }
                                        VStack(alignment:.leading){
                                            HStack{
                                                Text("Wind \(daypart.windSpeed?[index]?.description ?? "N/A")")
                                                    .bold()
                                                
                                                Text("\(daypart.windDirectionCardinal?[index] ?? "N/A")")
                                                    .bold()
                                                
                                                
                                            }
                                            HStack {
                                                let precipChance = (daypart.precipChance?[index] ?? 0) < 10 ? 0 : daypart.precipChance?[index] ?? 0
                                                Text("Rain \(precipChance)%")
                                                    .bold()
                                            }
                                        }
                                    }
                                    .padding(.top, -10.0)
                                    Text("\(daypart.narrative?[index] ?? "N/A")")
                                    divide()
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

struct divide: View {
    var body: some View {
        Divider()
            .frame(height: 0.7)
            .background(Color.primary)
            .padding(.horizontal)
            .padding(.top)
    }
}
