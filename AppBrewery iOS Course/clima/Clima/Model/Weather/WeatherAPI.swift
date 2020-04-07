//
//  Weather.swift
//  Clima
//
//  Created by Ionut Vasile on 04/03/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherAPIDelegate {
    func didUpdateWeather(_ weatherAPI: WeatherAPI, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherAPI {
    // appid == apikey
    let baseURL : String = "https://api.openweathermap.org/data/2.5/weather?appid=f66fc127d5aedb8d17e8a19fd29aef63&units=metric"
    
    var delegate : WeatherAPIDelegate?
    
    func getWeatherByCityName(_ city : String) {
        let url = "\(baseURL)&q=\(city)"
        requestData(from: url)
    }
    
    func getWeatherByCoordinates(_ lat : CLLocationDegrees, _ long: CLLocationDegrees) {
        let url = "\(baseURL)&lat=\(lat)&lon=\(long)"
        requestData(from: url)
    }
    
    func requestData(from urlString: String) {
        // 1. create url
        if let url = URL(string: urlString) {
            // 2. create a URLSession
            let session = URLSession(configuration: .default)
            // 3. give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            // 4. start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let city = decodedData.name
            
            let weather = WeatherModel(id: id, city: city, temperature: temp)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    

}
