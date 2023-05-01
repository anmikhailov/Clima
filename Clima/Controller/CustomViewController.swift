//
//  CustomViewController.swift
//  Clima
//
//  Created by Andrey on 01.05.2023.
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
