//
//  AssetListSceneBuilder.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation
import UIKit

final class AssetListSceneBuilder {
    static func build(viewModel: AssetListViewModel) -> AssetListViewController {
        let storyboard = UIStoryboard(name: "AssetList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AssetListViewController") as! AssetListViewController
        viewController.viewModel = AssetListViewModel(service: appContainer.service)
        return viewController
    }
}
