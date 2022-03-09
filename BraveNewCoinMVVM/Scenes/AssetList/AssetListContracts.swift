//
//  AssetListContracts.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

protocol AssetListViewModelProtocol {
    var delegate : AssetListViewModelDelegate? { get set }
    var assetList: [AssetPresentation] { get set }
    func loadData()
    func selectAsset(at index: Int)
    func refreshData()
}

enum AssetListViewModelOutput: Equatable {
    case setLoading(Bool)
    case error(NetworkErrors)
    case showAssetList
}

protocol AssetListViewModelDelegate : AnyObject {
    func handleViewModelOutput(_ output: AssetListViewModelOutput)
    func assetDetailSceneRouter(_ router: AssetDetailRouter)
}

enum AssetDetailRouter {
    case assetDetailId(_ viewModel: AssetDetailViewModel)
}
