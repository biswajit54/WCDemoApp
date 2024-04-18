//
//  WeeklyWeatherRowView.swift
//  WCWeatherApp
//
//  Created by Biswajit Palei on 19/04/24.
//

import SwiftUI

struct WeeklyWeatherRowView: View {
    let viewModel: WeatherRowViewModel
    @Binding var temperatureUnit: TemperatureUnit

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(viewModel.day)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            VStack(alignment: .leading) {
                Text("\(viewModel.icon)")
                    .font(.body)
                    .frame(maxWidth: .infinity)

                Text("\(viewModel.description)")
                    .font(.footnote)
                    .frame(maxWidth: .infinity)

            }

            HStack(alignment: .center, spacing: 10.0) {
                Text(String(format: "%.1f°", convert(temperature: viewModel.maxTemperature, to: temperatureUnit)))
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text(String(format: "%.1f°", convert(temperature: viewModel.minTemperature, to: temperatureUnit)))
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}
