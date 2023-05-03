//
//  WeatherViewController.swift
//  Clima
//
//  Created by Andrey on 01.05.2023.
//

import UIKit
import CoreLocation

class WeatherViewController: CustomViewController<WeatherView> {
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customView.delegate = self
        customView.cityTextField.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

//MARK: - WeatherViewDelegate
extension WeatherViewController: WeatherViewDelegate {
    func WeatherView(_ view: WeatherView, didTapSearchButton button: UIButton) {
        endEditing()
    }
    
    func WeatherView(_ view: WeatherView, didTapLocationButton button: UIButton) {
        locationManager.requestLocation()
    }
}

//MARK: - TextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = customView.cityTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        customView.cityTextField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if customView.cityTextField.text != "" {
            return true
        } else {
            customView.cityTextField.placeholder = "Type something"
            return false
        }
    }
    
    func endEditing() {
        customView.cityTextField.endEditing(true)
    }
}

//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.customView.conditionImage = weather.conditionImage
            self.customView.temperatureLabelText = weather.temperatureString
            self.customView.cityLabelText = weather.cityName
        }
    }
    
    func didFailError(_ weatherManager: WeatherManager, error: Error) {
        print(error)
    }
}

//MARK: - CLLocationmanagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
