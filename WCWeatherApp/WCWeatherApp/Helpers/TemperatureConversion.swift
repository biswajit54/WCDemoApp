//
//  TemperatureConversion.swift
//  WCWeatherApp
//
//  Created by Biswajit Palei on 19/04/24.
//

import Foundation

func convert(temperature temp: Double, to unit: TemperatureUnit) -> Double {
    switch unit {
        case .celsius:
            return temp
        case .fahrenheit:
            return (temp * 1.8) + 32
        default:
            return 0.0
    }
}
