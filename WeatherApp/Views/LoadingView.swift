//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Manish Sharma on 25/06/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View{
        LoadingView()
    }
}
