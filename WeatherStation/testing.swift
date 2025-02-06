
import SwiftUI

struct ImagesView: View {
    let imageUrls = [
        "https://thedriveweather.com/images/OutsideTempHistory.gif",
        "https://thedriveweather.com/images/HiWindSpeedHistory.gif",
        "https://thedriveweather.com/images/RainHistory.gif",
        "https://thedriveweather.com/images/OutsideHumidityHistory.gif"
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(imageUrls, id: \.self) { url in
                    AsyncImage(url: URL(string: url)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 300)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesView()
    }
}
