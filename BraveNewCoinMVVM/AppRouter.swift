//
//  AppRouter.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation
import UIKit

class AppRouter
{
    func start(scene: UIWindowScene) -> UIWindow
    {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let marketListVC = MarketListSceneBuilder.build()
        let navigationController = UINavigationController(rootViewController: marketListVC)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        window.windowScene = scene
        return window
    }
}
