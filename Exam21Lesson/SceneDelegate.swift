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
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
      
        let viewController = ImageListViewController()
        viewController.dataManager = buildNarutoManager()

        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

extension SceneDelegate {
    func buildNarutoManager() -> IDataManager {
        let narutoManger = NarutoManager()
        let dataManager = NarutoDataManager(narutoCharacters: narutoManger.getNarutosCharacters())
        return dataManager
    }
}


