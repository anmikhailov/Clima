//
//  MainViewController.swift
//  EmptyProject
//
//  Created by Andrey on 25.04.2023.
//

import UIKit

class StartViewController: CustomViewController<StartView> {
    
    override func loadView() {
        super.loadView()
        
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        
//        customView.delegate = self
    }
    
    
}

//extension GameViewController: GameViewDelegate {
//    func GameView(_ view: GameView, didTapButton button: UIButton) {
//    }
//}
