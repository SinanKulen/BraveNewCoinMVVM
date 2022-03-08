//
//  AssetDetailContracts.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 7.03.2022.
//

import Foundation

protocol AssetDetailViewModelProtocol {
    var delegate : AssetListViewModelDelegate? { get set }
    var assetDetail : AssetDetailPresentation! { get set }
    func loadData()
    func refreshData()
}

enum AssetDetailViewModelOutput {
    case setLoading(Bool)
    case error(NetworkErrors)
    case showAssetDetail
}

protocol AssetDetailViewModelDelegate : AnyObject {
    func handleViewModelOutput(_ output: AssetListViewModelOutput)
}
