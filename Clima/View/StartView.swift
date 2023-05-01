//
//  MainView.swift
//  EmptyProject
//
//  Created by Andrey on 25.04.2023.
//

import UIKit

protocol StartViewDelegate: AnyObject {
//    func RightView(_ view: RightView, didTapButton button: UIButton)
}

class StartView: CustomView {
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
//private extension MainView {
//    @objc func didTapButton(_ button: UIButton) {
//        delegate?.RightView(self, didTapButton: button)
//    }
//}
