import SwiftUI

struct WeatherView2: View {
    
    @State private var weather = [WeatherD]()
    @StateObject private var formatter = Formats()
    
    @State private var timer = Timer.publish(every: 240, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            SetBackground()
            
            if weather.isEmpty {
                // Show this while data is loading
                ProgressView()
                    .padding()
                    //.background(Color(.systemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 5)
            } else {
                // Show actual weather data once loaded
                let lastUpdateDate: String = weather.first?.date ?? "n/a"
                let lastUpdateTime = formatter.formatTime(weather.first?.time ?? "n/a")
                let timeIsRecent = formatter.isWithinThirtyMinutes(date: lastUpdateDate, time: lastUpdateTime)
                
                ScrollView {
                    VStack {
                        screenHeader()
                        
                        Text("Last update:")
                            .foregroundColor(timeIsRecent ? .primary : .red)
                        
                        Text(" \(lastUpdateTime) \(lastUpdateDate)")
                            .foregroundColor(timeIsRecent ? .primary : .red)
                        
                        ForEach(weather) { i in
                            VStack {
                                TempsView2(wthr: i)
                                WindView2(wthr: i)
                                RainView2(wthr: i)
                                BarView2(wthr: i)
                                HumidView2(wthr: i)
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .onAppear {
            fetchWeatherData()
        }
    }
    
    private func fetchWeatherData() {
        WeatherAPI().getWeatherData { fetchedWeather in
            DispatchQueue.main.async {
                self.weather = fetchedWeather
            }
        }
    }
}

#Preview {
    WeatherView2()
}

struct screenHeader: View {
    var body: some View {
        VStack {
            Text("Jeffs weather station")
                .font(.title)
            
            Text("Located at 200 E Mountain Dr")
                .font(.title3)
            
            Text("Santa Barbara, Ca")
                .font(.title3)
            
            Image("ftn02")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .cornerRadius(13)
        }
    }
}

