//
//  extensions.swift
//  breakiingBad
//
//  Created by Jeff Neely on 8/22/24.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

//extension DateTime {
//    func validateUpdate() {
//        // Your validation logic
//        if time.isEmpty || date.isEmpty {
//            print("Invalid update: time or date is missing.")
//        } else {
//            print("Validation passed for \(time) on \(date).")
//        }
//    }
//}

