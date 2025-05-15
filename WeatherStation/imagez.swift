import SwiftUI
import SDWebImageSwiftUI

struct ImagesViewxyz: View {
    var body: some View {
        WebImage(url: URL(string: "https://cameras.alertcalifornia.org/public-camera-data/Axis-TVHillMontecito1/latest-frame.jpg"))
            .resizable()
           // .indicator(.activity) // Displays an activity indicator while loading
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
    }
}

