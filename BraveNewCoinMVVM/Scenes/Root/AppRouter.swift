//
//  AppRouter.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation
import UIKit

class AppRouter {
    func start(scene: UIWindowScene) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = TabBarController()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        window.windowScene = scene
        return window
    }
}
