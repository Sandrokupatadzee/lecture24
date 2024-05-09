//
//  SceneDelegate.swift
//  lecture24
//
//  Created by MacBook Pro on 08.05.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        window?.rootViewController = UINavigationController(rootViewController: MainScreen())
        window?.makeKeyAndVisible()
    }


}

