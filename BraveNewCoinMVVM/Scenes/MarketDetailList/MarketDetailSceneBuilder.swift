//
//  MarketDetailSceneBuilder.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 6.03.2022.
//

import Foundation
import UIKit

final class MarketDetailSceneBuilder {
    static func build(with viewModel: MarketDetailViewModel) -> MarketDetailViewController {
        let storyboard = UIStoryboard(name: "MarketDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MarketDetailViewController") as! MarketDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
