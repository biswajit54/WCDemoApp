//
//  WeatherDetailView.swift
//  WCWeatherApp
//
//  Created by Biswajit Palei on 19/04/24.
//

import SwiftUI

struct WeatherDetailView: View {
    @ObservedObject private var viewModel = WeeklyWeatherViewModel()
    var currentForecast: CurrentWeatherForecast
    var coordinates: Coordinates
    @Binding var temperatureUnit: TemperatureUnit

    var body: some View {
        switch viewModel.state {
            case .idle:
                Color.clear.onAppear {
                    viewModel.weeklyWeather(forCoordinates: coordinates)
                }
            case .loading:
                ProgressView()
            case .failed(let error):
                Text("No results \(error.localizedDescription)")
            case .loaded:
                List {
                    Section {
                        todaysForecast
                    }
                    Section(header: Text("")) {
                        weeklyForecast
                    }
                    Section(header: Text("")) {
                        sunInfoSection
                        rainInfoSection
                        additionalInfoSection
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(currentForecast.name)
        }
    }
}

private extension WeatherDetailView {
    var todaysForecast: some View {
        VStack {
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("\(currentForecast.name)")
                        .font(.largeTitle)
                    Text("\(currentForecast.weather.first!.weatherDescription)")
                        .font(.caption)
                    HStack {
                        Text("H: \(String(format: "%.1f", convert(temperature: currentForecast.main.maxTemperature, to: temperatureUnit)))°")
                            .font(.caption)
                        Text("L: \(String(format: "%.1f", convert(temperature: currentForecast.main.minTemperature, to: temperatureUnit)))°")
                            .font(.caption)
                    }
                }
                Spacer()
                Text(String(format: "%.1f°", convert(temperature: currentForecast.main.temperature, to: temperatureUnit)))
                    .font(.largeTitle)
            }
            Spacer()
        }
    }

    var weeklyForecast: some View {
        // Exlude the first weather forecast from displaying because it will be shown in the first section
        ForEach(1..<viewModel.dataSource.count) {
            let weatherViewModel = viewModel.dataSource[$0]
            WeeklyWeatherRowView(viewModel: weatherViewModel, temperatureUnit: $temperatureUnit)
        }
    }

    var sunInfoSection: some View {
        VStack {
            if let firstForecast = viewModel.dataSource.first {
                HStack {
                    WeatherInfoView(title: "SUNRISE", information: "\(firstForecast.sunrise)")
                    WeatherInfoView(title: "SUNSET", information: "\(firstForecast.sunset)")
                }
            }
        }
    }

    var rainInfoSection: some View {
        VStack {
            if let firstForecast = viewModel.dataSource.first {
                HStack {
                    WeatherInfoView(title: "CHANCE OF RAIN", information: "\(firstForecast.precipitation)")
                    WeatherInfoView(title: "HUMIDITY", information: "\(firstForecast.humidity)")
                }
            }
        }
    }

    var additionalInfoSection: some View {
        VStack {
            if let firstForecast = viewModel.dataSource.first {
                HStack {
                    WeatherInfoView(title: "UV", information: "\(firstForecast.uvIndex)")
                    WeatherInfoView(title: "FEELS LIKE",
                                    information:
                                        String(format: "%.1f", convert(temperature: firstForecast.feelsLike, to: temperatureUnit)))
                }
            }
        }
    }
}

struct WeatherInfoView: View {
    var title: String
    var information: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption2)
            Text(information)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
