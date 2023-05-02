//
//  WeatherManager.swift
//  Clima
//
//  Created by Andrey on 02.05.2023.
//

import Foundation

protocol WeatherManagerDelegate: AnyObject {
    func didUpdateWeather(_ weather: WeatherModel)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=c51d65ccabd22fbabb377d79b7e43c40&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1. Create a URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(weather)
                    }
                }
            }
            
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let icon = decodedData.weather[0].icon
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(cityName: name, temperature: temp, conditionIconRaw: icon)
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
    
    
}
