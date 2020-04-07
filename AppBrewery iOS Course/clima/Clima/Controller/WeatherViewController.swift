//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var locationInput: UITextField!
    
    var weatherAPI = WeatherAPI()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationInput.delegate = self
        weatherAPI.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    
    @IBAction func getLocation(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
}

// MARK: - Dealing with the input

extension WeatherViewController : UITextFieldDelegate {
    
    // handle the search button press
    @IBAction func search(_ sender: UIButton) {
        locationInput.endEditing(true)
    }
    
    // handle the Keyboard Return Key press
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        locationInput.endEditing(true)
        return true
    }
    
    // input validation
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "This input should not be empty!"
            return false
        }
    }
    
    // after editing ended (keyboard dissmissed), do what you want to do with the input from the user, then reset the input text
    func textFieldDidEndEditing(_ textField: UITextField) {
        weatherAPI.getWeatherByCityName(locationInput.text ?? "")
        locationInput.text = ""
    }
}

// MARK: - Dealing with the Weather API

extension WeatherViewController: WeatherAPIDelegate {
    
    func didUpdateWeather(_ weatherAPI: WeatherAPI, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.city
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.iconName)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

// MARK: - Dealing with the CoreLocation

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error on getting core location data")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            weatherAPI.getWeatherByCoordinates(lat, long)
        }
    }
}
