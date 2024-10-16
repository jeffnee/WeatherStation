//
//  showGraphImage.swift
//  breakiingBad
//
//  Created by Jeff Neely on 8/25/24.
//

import SwiftUI

struct ShowGraphImage: View {
    
    var graphUrl: String
    
    var body: some View {
        VStack(alignment: .center){
            AsyncImage(url: URL(string: graphUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 320, height: 200)
            .cornerRadius(15)
            
        }
    }
}
