//
//  SceneDelegate.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 09.10.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let dataManager = NarutoDataManager()
        let charactersArray = dataManager.narutoManager.getNarutosCharacters().sorted(by: >)
        dataManager.narutoCharacters = charactersArray
        printCustomDescription()
        
        let viewController = ViewController()
        viewController.narutoData = dataManager
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        func printCustomDescription() {
            charactersArray.forEach { print($0) }
        }
    }
}

