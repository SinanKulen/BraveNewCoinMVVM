//
//  MarketDetailSceneBuilder.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 6.03.2022.
//

import Foundation
import UIKit

final class MarketDetailSceneBuilder {
    static func build(id: String) -> MarketDetailViewController {
        let storyboard = UIStoryboard(name: "MarketDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MarketDetailViewController") as! MarketDetailViewController
        viewController.viewModel = MarketDetailViewModel(id: "", service: appContainer.service)
        return viewController
    }
}
