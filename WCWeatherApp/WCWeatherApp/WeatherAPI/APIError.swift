//
//  APIError.swift
//  WCWeatherApp
//
//  Created by Biswajit Palei on 19/04/24.
//

import Foundation

enum APIError: Error {
    case parsing(description: String)
    case network(description: String)
}

