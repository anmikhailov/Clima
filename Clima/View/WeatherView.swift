//
//  WeatherView.swift
//  Clima
//
//  Created by Andrey on 01.05.2023.
//

import UIKit

protocol WeatherViewDelegate: AnyObject {
    func WeatherView(_ view: WeatherView, didTapSearchButton button: UIButton)
}

class WeatherView: CustomView {
    weak var delegate: WeatherViewDelegate?
    
    var cityTextField: UITextField {
        return cityNameTextField
    }
    
    var conditionImage: UIImage? {
        get {
            conditionImageView.image
        }
        set {
            conditionImageView.image = newValue
        }
    }
    
    private lazy var backgroundLight: UIImageView = {
        let element = UIImageView()
        element.image = Resources.Images.background
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainVStack: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 20
        element.distribution = .fill
        element.alignment = .trailing
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var chooseCityHStack: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 10
        element.distribution = .fillProportionally
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var locationButton: UIButton = {
        let element = UIButton()
        element.restorationIdentifier = "location"
        element.setBackgroundImage(Resources.Images.locationIcon, for: .normal)
        element.tintColor = .label
        element.translatesAutoresizingMaskIntoConstraints = false
//        element.addTarget(<#T##target: Any?##Any?#>, action: #selector(<#selector#>), for: <#T##UIControl.Event#>)
        return element
    }()
    
    private lazy var cityNameTextField: UITextField = {
        let element = UITextField()
        let paragraphStyle = NSMutableParagraphStyle()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: element.frame.height))
        
        element.backgroundColor = Resources.Colors.textFieldColor
        
        element.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25),
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ])
        element.rightView = paddingView
        element.rightViewMode = .always
        element.font = UIFont.systemFont(ofSize: 25)
        element.textAlignment = .right
        
        element.autocapitalizationType = .words
        element.returnKeyType = .go
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var searchButton: UIButton = {
        let element = UIButton()
        element.restorationIdentifier = "search"
        element.setBackgroundImage(Resources.Images.searchIcon, for: .normal)
        element.tintColor = .label
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(didTapSearchButton), for: .touchUpInside)
        return element
    }()
    
    private lazy var conditionImageView: UIImageView = {
        let element = UIImageView()
        element.image = Resources.Images.clearSkyIcon
        element.tintColor = Resources.Colors.weatherColor
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var temperatureHStack: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 5
        element.distribution = .fill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var temperatureValueLabel: UILabel = {
        let element = UILabel()
        element.text = "21"
        element.font = UIFont.systemFont(ofSize: 80, weight: .black)
        element.textColor = .label
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var degreeLabel: UILabel = {
        let element = UILabel()
        element.text = "℃"
        element.font = UIFont.systemFont(ofSize: 100)
        element.textColor = .label
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var cityLabel: UILabel = {
        let element = UILabel()
        element.text = "Kazan"
        element.font = UIFont.systemFont(ofSize: 30)
        element.textColor = .label
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func setViews() {
        super.setViews()
        
        self.addSubview(backgroundLight)
        self.addSubview(mainVStack)
        
        mainVStack.addArrangedSubview(chooseCityHStack)
        mainVStack.addArrangedSubview(conditionImageView)
        mainVStack.addArrangedSubview(temperatureHStack)
        mainVStack.addArrangedSubview(cityLabel)
        
        chooseCityHStack.addArrangedSubview(locationButton)
        chooseCityHStack.addArrangedSubview(cityNameTextField)
        chooseCityHStack.addArrangedSubview(searchButton)
        
        temperatureHStack.addArrangedSubview(temperatureValueLabel)
        temperatureHStack.addArrangedSubview(degreeLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            backgroundLight.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundLight.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundLight.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundLight.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            mainVStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            mainVStack.heightAnchor.constraint(equalToConstant: 350),
            mainVStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            mainVStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            chooseCityHStack.leadingAnchor.constraint(equalTo: mainVStack.leadingAnchor),
            chooseCityHStack.trailingAnchor.constraint(equalTo: mainVStack.trailingAnchor),
            chooseCityHStack.heightAnchor.constraint(equalToConstant: 40),
            
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            
            conditionImageView.heightAnchor.constraint(equalToConstant: 120),
            conditionImageView.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
}

//MARK: - Actions
private extension WeatherView {
    @objc func didTapSearchButton(_ button: UIButton) {
        delegate?.WeatherView(self, didTapSearchButton: button)
    }
}
