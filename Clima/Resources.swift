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
        static var sunnyIcon = UIImage(systemName: "sun.max")
    }
    enum Colors {
        static var textFieldColor = UIColor.systemFill
        static var weatherColor = UIColor(named: "WeatherColor")
        
    }
}
