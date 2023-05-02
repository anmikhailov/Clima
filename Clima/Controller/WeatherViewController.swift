//
//  WeatherViewController.swift
//  Clima
//
//  Created by Andrey on 01.05.2023.
//

import UIKit

class WeatherViewController: CustomViewController<WeatherView>, UITextFieldDelegate {
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        customView.cityTextField.delegate = self
    }
    
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

extension WeatherViewController: WeatherViewDelegate {
    func WeatherView(_ view: WeatherView, didTapSearchButton button: UIButton) {
        endEditing()
    }
}
