import SwiftUI
import Combine

// Model for tide data
struct Tide: Identifiable {
    let id = UUID()
    let time: Date
    let height: Double
}

// ViewModel to fetch tide data
// : MARK Tide view model
class TideViewModel: ObservableObject {
    @Published var tides: [Tide] = []
    private var cancellables = Set<AnyCancellable>()

    func fetchTides() {
        print("in func")
        let urlString = "https://api.tidesandcurrents.noaa.gov/api/prod/datagetter?product=predictions&application=NOS.COOPS.TAC.WL&begin_date=20250106&range=48&datum=MLLW&station=9411340&time_zone=lst_ldt&units=english&format=json&interval=hilo"
        guard let url = URL(string: urlString) else { return }
        print("url=--> \(url)")
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: NOAAResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                print("COMPL+*9+………….&&&=--->\(completion)")
                      
                switch completion {
                case .failure(let error):
                    print("Error fetching tide data: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] response in
                self?.tides = response.predictions.compactMap {
                    guard let time = ISO8601DateFormatter().date(from: $0.time),
                          let height = Double($0.value) else { return nil }
                    return Tide(time: time, height: height)
                }
            })
            .store(in: &cancellables)
    }
}

// NOAA Response Model
struct NOAAResponse: Codable {
    struct Prediction: Codable {
        let time: String
        let value: String
    }
    let predictions: [Prediction]
}

// Main View
struct TideGraphView: View {
    @StateObject private var viewModel = TideViewModel()

    var body: some View {
        VStack {
            Text("Santa Barbara Tides (24 Hours)")
                .font(.title)
                .padding()

            if viewModel.tides.isEmpty {
                Text("Loading tide data...")
                    .onAppear {
                        viewModel.fetchTides()
                    }
            } else {
                GraphView(tides: viewModel.tides)
                    .padding()
            }
        }
    }
}

// Graph View
struct GraphView: View {
    let tides: [Tide]

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                guard let firstTide = tides.first else { return }

                let heightRange = (tides.map { $0.height }.min() ?? 0)...(tides.map { $0.height }.max() ?? 1)
                let timeRange = (tides.first?.time.timeIntervalSince1970 ?? 0)...(tides.last?.time.timeIntervalSince1970 ?? 1)

                let xScale = geometry.size.width / CGFloat(timeRange.upperBound - timeRange.lowerBound)
                let yScale = geometry.size.height / CGFloat(heightRange.upperBound - heightRange.lowerBound)

                path.move(to: CGPoint(
                    x: CGFloat(firstTide.time.timeIntervalSince1970 - timeRange.lowerBound) * xScale,
                    y: geometry.size.height - CGFloat(firstTide.height - heightRange.lowerBound) * yScale
                ))

                for tide in tides {
                    let x = CGFloat(tide.time.timeIntervalSince1970 - timeRange.lowerBound) * xScale
                    let y = geometry.size.height - CGFloat(tide.height - heightRange.lowerBound) * yScale
                    path.addLine(to: CGPoint(x: x, y: y))
                }
            }
            .stroke(Color.blue, lineWidth: 2)
        }
        .frame(height: 200)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

//@main
//struct TideApp: App {
//    var body: some Scene {
//        WindowGroup {
//            TideGraphView()
//        }
//    }
//}

