//
//  AboutView.swift
//  WeatherStation
//
//  Created by Jeff Neely on 9/1/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        Text("About")
            .font(.largeTitle)
        Text("This App is a shorter version of my webpage 'thedriveweather.com' this is my first attempt of making an app so I'm not really sure how it's going to look on all the varieties of cell phones and iPads. I would appreciate if you notice text not lining up correctly, invalid data or anything else that does not appear correctly. I welcome any suggestions and feedback on how I can make it look better etc. Also, there are two versions of the main screen. And I can't decide which one is best so I would like to hear your opinion. My email is jeffnneely@gmail.com")
            .padding()
        
        Spacer()
    }
}

#Preview {
    AboutView()
}
