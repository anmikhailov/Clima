//
//  Resources.swift
//  Clima
//
//  Created by Andrey on 01.05.2023.
//

import Foundation
import UIKit

enum Resources {
    enum Images {
        static var background = UIImage(named: "background")
        static var locationIcon = UIImage(systemName: "location.circle.fill")
        static var searchIcon = UIImage(systemName: "magnifyingglass")
        static var clearSkyIcon = UIImage(systemName: "sun.max")
        static var fewCloudsIcon = UIImage(systemName: "cloud.sun")
        static var scatteredCloudsIcon = UIImage(systemName: "cloud")
        static var brokenCloudsIcon = UIImage(systemName: "smoke")
        static var showerRainIcon = UIImage(systemName: "cloud.rain")
        static var rainIcon = UIImage(systemName: "cloud.sun.rain")
        static var thunderstormIcon = UIImage(systemName: "cloud.bolt.rain")
        static var snowIcon = UIImage(systemName: "snowflake")
        static var mistIcon = UIImage(systemName: "cloud.fog")
    }
    enum Colors {
        static var textFieldColor = UIColor.systemFill
        static var weatherColor = UIColor(named: "WeatherColor")
        
    }
}
