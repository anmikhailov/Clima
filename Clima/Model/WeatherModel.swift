//
//  WeatherModel.swift
//  Clima
//
//  Created by Andrey on 02.05.2023.
//

import Foundation
import UIKit

struct WeatherModel {
    let cityName: String
    let temperature: Double
    let conditionIconRaw: String
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionImage: UIImage? {
        switch conditionIconRaw {
        case "01d", "01n":
            return Resources.Images.clearSkyIcon
        case "02d", "02n":
            return Resources.Images.fewCloudsIcon
        case "03d", "03n":
            return Resources.Images.scatteredCloudsIcon
        case "04d", "04n":
            return Resources.Images.brokenCloudsIcon
        case "09d", "09n":
            return Resources.Images.showerRainIcon
        case "10d", "10n":
            return Resources.Images.rainIcon
        case "11d", "11n":
            return Resources.Images.thunderstormIcon
        case "13d", "13n":
            return Resources.Images.snowIcon
        case "50d", "50n":
            return Resources.Images.mistIcon
        default:
            return nil
        }
    }
}
