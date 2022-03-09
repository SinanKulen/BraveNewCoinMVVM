//
//  MarketListSceneCBuilder.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation
import UIKit

final class MarketListSceneBuilder {
    static func build(viewModel: MarketListViewModel) -> MarketListViewController {
        let storyboard = UIStoryboard(name: "MarketList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MarketListViewController") as! MarketListViewController
        viewController.viewModel = MarketListViewModel(service: appContainer.service)
        return viewController
    }
}
