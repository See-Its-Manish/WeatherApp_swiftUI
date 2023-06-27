//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Manish Sharma on 26/06/23.
//

import SwiftUI

let weatherSymbols: [String: String] = [
    "01d": "sun.max.fill",
    "01n": "moon.fill",
    "02d": "cloud.sun.fill",
    "02n": "cloud.moon.fill",
    "03d": "cloud.fill",
    "03n": "cloud.fill",
    "04d": "cloud.fill",
    "04n": "cloud.fill",
    "09d": "cloud.heavyrain.fill",
    "09n": "cloud.heavyrain.fill",
    "10d": "cloud.sun.rain.fill",
    "10n": "cloud.moon.rain.fill",
    "11d": "cloud.bolt.fill",
    "11n": "cloud.bolt.fill",
    "13d": "snow",
    "13n": "snow",
    "50d": "cloud.fog.fill",
    "50n": "cloud.fog.fill"
]

func getSymbolName(iconCode: String) -> String {
    return weatherSymbols[iconCode] ?? "questionmark.circle.fill"
}

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        
        
        ZStack(alignment: .leading) {
            
            VStack (alignment: .leading, spacing: 5) {
                
                VStack {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        
                        VStack(spacing: 20) {
                            Image(systemName: getSymbolName(iconCode: weather.weather[0].icon))
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°C")
                            .font(.system(size:100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .padding(.horizontal,30)
                    
                    Spacer()
                        .frame(height: 80)
                    
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin).roundDouble() + "°")
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax).roundDouble() + "°")
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind", value: (weather.wind.speed).roundDouble() + "m/s")
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity).roundDouble() + "%")
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.667, saturation: 0.922, brightness: 0.684))
                .background(.white)
                .cornerRadius(radius: 20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.667, saturation: 0.922, brightness: 0.684))
        .preferredColorScheme(.dark)
    }
    
    
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
