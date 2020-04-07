//
//  WeatherModel.swift
//  Clima
//
//  Created by Ionut Vasile on 04/03/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Decodable {
    let name : String
    let main : Main
    let weather : [Weather]
}

struct Main : Decodable {
    let temp : Double
}

struct Weather : Decodable {
    let description : String
    let id : Int
}
