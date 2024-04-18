//
//  SharedResponseTypes.swift
//  WCWeatherApp
//
//  Created by Biswajit Palei on 19/04/24.
//

import Foundation

// Weather description
enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
    case thunderstorm = "Thunderstorm"
    case drizzle = "Drizzle"
}

// Geographic coordinates
struct Coord: Codable {
    let lat, lon: Double
}

