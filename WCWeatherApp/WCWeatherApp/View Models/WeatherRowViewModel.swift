//
//  WeatherRowViewModel.swift
//  WCWeatherApp
//
//  Created by Biswajit Palei on 19/04/24.
//

import Foundation

struct WeatherRowViewModel: Identifiable {
    private let forecast: Forecast
    private let timeZone: String
    let id: UUID = UUID()

    var icon: String {
        switch forecast.weather[0].main {
            case .snow:
                return "🌨"
            case .clear:
                return "☀️"
            case .clouds:
                return "🌥"
            case .thunderstorm:
                return "⛈"
            case .drizzle:
                return "🌦"
            case .rain:
                return "🌧"
        }
    }

    var day: String {
        return dayFormatter.string(from: forecast.date)
    }

    var description: String {
        guard let description = forecast.weather.first?.weatherDescription else { return "" }
        return description
    }

    var maxTemperature: Double {
        forecast.temp.max
    }

    var minTemperature: Double {
        forecast.temp.min
    }

    var humidity: String {
        return String(format: "%d%%", forecast.humidity)
    }

    var precipitation: String {
        return String(format: "%.0f%%", forecast.pop)
    }

    var sunrise: String {
        return timeFormatter(forTimeZone: timeZone).string(from: forecast.sunrise)
    }

    var sunset: String {
        return timeFormatter(forTimeZone: timeZone).string(from: forecast.sunset)
    }

    var feelsLike: Double {
        let timeOfDay = timeOfTheDay
        switch timeOfDay {
            case .morning:
                return forecast.feelsLike.morn
            case .day:
                return forecast.feelsLike.day
            case .evening:
                return forecast.feelsLike.eve
            case .night:
                return forecast.feelsLike.night

        }
    }

    var amountOfRain: Double {
        return forecast.rain ?? 0.0
    }

    var uvIndex: String {
        return String(format: "%d", forecast.uvi)
    }

    init(forecast: Forecast, timeZone: String) {
        self.forecast = forecast
        self.timeZone = timeZone
    }
}
