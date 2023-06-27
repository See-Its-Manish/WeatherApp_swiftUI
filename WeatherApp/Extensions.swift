//
//  Extensions.swift
//  WeatherApp
//
//  Created by Manish Sharma on 26/06/23.
//

import Foundation
import SwiftUI


extension Double{
    func roundDouble() -> String {
        return String(format: "%.0f",self)
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
}


struct RoundedCorners: Shape{
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
