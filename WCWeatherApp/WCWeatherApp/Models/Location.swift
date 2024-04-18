//
//  Location.swift
//  WCWeatherApp
//
//  Created by Biswajit Palei on 19/04/24.
//

import Foundation

struct LocationElement: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let lat, lon: Double
    let country: String
    let state: String?

    enum CodingKeys: String, CodingKey {
        case name
        case lat, lon, country, state
    }
}

typealias Location = [LocationElement]

