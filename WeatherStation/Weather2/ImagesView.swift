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
    
    let imageDescription = [
        
        "Santa Barbara from TV hill.",
        
        "View from Gibralter road.",
        
        "Cachuma lake.",
        
        "The rain per sesion.",
        
        "High's and low's."
    ]
    
    var body: some View {
        ZStack{
            SetBackground()
            
            ScrollView {
                ForEach(0..<imageURLs.count, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(imageDescription[index])
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .padding([.top, .horizontal])
                        
                        if let originalURL = URL(string: imageURLs[index]) {
                            let freshURL = originalURL.appendingQueryItem(name: "t", value: "\(Date().timeIntervalSince1970)")
                            
                            AsyncImage(url: freshURL) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 320, height: 155)
                                    
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 320, height: 155)
                                        .clipped()
                                        .onTapGesture {
                                            selectedImage = ImageItem(url: imageURLs[index])
                                        }
                                    
                                case .failure:
                                    Image(systemName: "exclamationmark.triangle")
                                        .frame(width: 320, height: 155)
                                    
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                    }
                    .padding()
                    .fullScreenCover(item: $selectedImage) { imageItem in
                        ZoomableImageView(imageURL: imageItem.url)
                            .onTapGesture {
                                selectedImage = nil // Dismiss on tap
                            }
                    }
                }
            }
        }
    }
}
