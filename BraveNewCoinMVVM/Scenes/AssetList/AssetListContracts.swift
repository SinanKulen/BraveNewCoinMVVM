//
//  AssetListContracts.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

protocol AssetListViewModelProtocol
{
    var delegate : AssetListViewModelDelegate? { get set }
    var asset: [AssetPresentation] { get set }
    func loadData()
    func refreshData()
}

enum AssetListViewModelOutput: Equatable
{
    case setLoading(Bool)
    case error(NetworkErrors)
    case showAssetList
}

protocol AssetListViewModelDelegate : AnyObject
{
    func handleViewModelOutput(_ output: AssetListViewModelOutput)
}
