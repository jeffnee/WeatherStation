import SwiftUI

struct ImageItem: Identifiable {
    let id = UUID()
    let url: String
}

struct ZoomableImageView: View {
    let imageURL: String
    @State private var scale: CGFloat = 1.0

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            AsyncImage(url: URL(string: imageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(scale)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    scale = value
                                }
                        )
                case .failure:
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}

struct ImagesView: View {
    @State private var selectedImage: ImageItem? = nil
    
    let imageURLs = [
        "https://cameras.alertcalifornia.org/public-camera-data/Axis-TVHillMontecito1/latest-frame.jpg",
        
        "https://cameras.alertcalifornia.org/public-camera-data/Axis-Gibraltar2/panogrid/latest-pg-6.jpg",
        
        "https://cameras.alertcalifornia.org/public-camera-data/Axis-SYP/latest-frame.jpg",
        
        "https://thedriveweather.com/images/rain.png",
        
        "https://thedriveweather.com/images/years.png"
    ]
    
    var body: some View {
        ZStack{
            SetBackground()
                ScrollView {
                VStack(spacing: 16) {
                    ForEach(imageURLs, id: \.self) { url in
                        AsyncImage(url: URL(string: url)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 300, height: 150)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 320, height: 155)
                                    .clipped()
                                    .onTapGesture {
                                        selectedImage = ImageItem(url: url)
                                    }
                            case .failure:
                                Image(systemName: "exclamationmark.triangle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 300, height: 150)
                                    .foregroundColor(.red)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                }
                .padding()
            }
            .fullScreenCover(item: $selectedImage) { imageItem in
                ZoomableImageView(imageURL: imageItem.url)
                     .onTapGesture {
                        selectedImage = nil
                    }
            }
        }
    }
}
