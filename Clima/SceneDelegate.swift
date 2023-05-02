//
//  SceneDelegate.swift
//  Clima
//
//  Created by Andrey on 01.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let mainVC = WeatherViewController()
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
    }
}
