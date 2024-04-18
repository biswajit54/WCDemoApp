//
//  WeatherFetchable.swift
//  WCWeatherApp
//
//  Created by Biswajit Palei on 19/04/24.
//

import Foundation
import Combine

protocol WeatherFetchable {
    func getFiveDayWeatherForecast(
        forCoordinates coord: Coordinates,
        unit: TemperatureUnit
    ) -> AnyPublisher<FiveDayWeatherForecast, APIError>

    func getSevenDayWeatherForecast(
        forCoordinates coord: Coordinates,
        unit: TemperatureUnit
    ) -> AnyPublisher<SevenDayWeatherForecast, APIError>

    func getCurrentWeatherForecast(
        forCoordinates coord: Coordinates,
        unit: TemperatureUnit
    ) -> AnyPublisher<CurrentWeatherForecast, APIError>

    func getLocations (
        forCity city: String
    ) -> AnyPublisher<Location, APIError>
}

