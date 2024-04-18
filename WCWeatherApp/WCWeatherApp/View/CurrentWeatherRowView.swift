//
//  CurrentWeatherRowView.swift
//  WCWeatherApp
//
//  Created by Biswajit Palei on 19/04/24.
//

import Foundation

import SwiftUI

struct CurrentWeatherRowView: View {
    let weather: CurrentWeatherForecast
    @Binding var temperatureUnit: TemperatureUnit

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(weather.name)")
                Text("\(weather.weather.first!.weatherDescription)")
                    .autocapitalization(.words)
                    .font(.caption2)
            }
            Spacer()
            Text("\(String(format: "%.1f", convert(temperature: weather.main.temperature, to: temperatureUnit)))°")
                .font(.title)
        }
    }
}
