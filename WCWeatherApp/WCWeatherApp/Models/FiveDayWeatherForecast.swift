//
//  FiveDayWeatherForecast.swift
//  WCWeatherApp
//
//  Created by Biswajit Palei on 19/04/24.
//

import Foundation

struct FiveDayWeatherForecast: Codable {
    let list: [Item]
    let city: City

    struct Item: Codable {
        let date: Date
        let main: MainClass
        let weather: [Weather]

        enum CodingKeys: String, CodingKey {
            case date = "dt"
            case main
            case weather
        }
    }

    struct City: Codable {
        let id: Int
        let name: String
        let coord: Coord
        let country: String
        let population, timezone, sunrise, sunset: Int
    }

    struct MainClass: Codable {
        let temp: Double
    }

    struct Weather: Codable {
        let main: MainEnum
        let weatherDescription: String

        enum CodingKeys: String, CodingKey {
            case main
            case weatherDescription = "description"
        }
    }
}
