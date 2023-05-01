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
    
    override func setViews() {
        super.setViews()
        
        // Add subviews
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        // Add constraints
    }
}

//MARK: - Actions
//private extension WeatherView {
//    @objc func didTapButton(_ button: UIButton) {
//        delegate?.RightView(self, didTapButton: button)
//    }
//}
