//
//  TabBarController.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 5.03.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   tabBar.backgroundColor = .black
    //    tabBar.unselectedItemTintColor = .white
        configureTabBar()
    }
    
    private func configureTabBar()
    {
        let marketVC = MarketListSceneBuilder.build()
        marketVC.title = "Markets"
        marketVC.tabBarItem = UITabBarItem(title: "Market", image: nil, tag: 0)
        let marketNC = UINavigationController(rootViewController: marketVC)
        
        let assetVC = AssetListSceneBuilder.build()
        assetVC.title = "Assets"
        assetVC.tabBarItem = UITabBarItem(title: "Asset", image: nil, tag: 1)
        let assetNC = UINavigationController(rootViewController: assetVC)
        
        viewControllers = [marketNC, assetNC]
    }

}
