//
//  ViewController.swift
//  CrocodileGame
//
//  Created by Sergey on 16.04.2023.
//

import UIKit

class CustomViewController<V: CustomView>: UIViewController {
    override func loadView() {
        view = V()
    }
    
    var customView: V {
        return view as! V
    }
}
