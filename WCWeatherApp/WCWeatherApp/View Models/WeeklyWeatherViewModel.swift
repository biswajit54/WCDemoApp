//
//  WeeklyWeatherViewModel.swift
//  WCWeatherApp
//
//  Created by Biswajit Palei on 19/04/24.
//

import Foundation
import Combine

class WeeklyWeatherViewModel: ObservableObject {
    var weather = WeatherAPI()
    @Published var dataSource: [WeatherRowViewModel] = []
    @Published private(set) var state = LoadingState.idle
    private var disposables = Set<AnyCancellable>()

    func weeklyWeather(forCoordinates coord: Coordinates) {
        self.state = .loading

        weather.getSevenDayWeatherForecast(forCoordinates: coord)
            .map { weather -> [WeatherRowViewModel] in
                let timeZone = weather.timezone
                return weather.forecast.map { forecast in
                    WeatherRowViewModel(forecast: forecast, timeZone: timeZone)
                }
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (value) in
                switch value {
                    case .finished:
                        break
                    case .failure(let error):
                        self?.state = .failed(error)
                }
            } receiveValue: { [weak self] (forecast) in
                self?.state = .loaded
                self?.dataSource = forecast
            }
            .store(in: &disposables)
    }
}

