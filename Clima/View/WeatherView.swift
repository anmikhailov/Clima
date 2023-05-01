//
//  WeatherView.swift
//  Clima
//
//  Created by Andrey on 01.05.2023.
//

import UIKit

protocol WeatherViewDelegate: AnyObject {
//    func RightView(_ view: RightView, didTapButton button: UIButton)
}

class WeatherView: CustomView {
//    weak var delegate: MainViewDelegate?
    
    private lazy var backgroundLight: UIImageView = {
        let element = UIImageView()
        element.image = Resources.Images.backgroundLight
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func setViews() {
        super.setViews()
        
        self.addSubview(backgroundLight)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            backgroundLight.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundLight.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundLight.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundLight.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}

//MARK: - Actions
//private extension WeatherView {
//    @objc func didTapButton(_ button: UIButton) {
//        delegate?.RightView(self, didTapButton: button)
//    }
//}
