//
//  AssetDetailSceneBuilder.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 7.03.2022.
//

import Foundation
import UIKit

final class AssetDetailSceneBuilder {
    static func build(with viewModel : AssetDetailViewModel) -> AssetDetailViewController {
        let storyboard = UIStoryboard(name: "AssetDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AssetDetailViewController") as! AssetDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
