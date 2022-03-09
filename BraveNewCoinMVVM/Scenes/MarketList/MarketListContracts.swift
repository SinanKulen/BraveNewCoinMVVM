//
//  MarketListContracts.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

protocol MarketListViewModelProtocol {
    var delegate : MarketListViewModelDelegate? { get set }
    var marketList: [MarketPresentation] { get set }
    func loadData()
    func selectMarket(at index: Int) 
    func refreshData()
}

enum MarketListViewModelOutput: Equatable {
    case setLoading(Bool)
    case error(NetworkErrors)
    case showMarketList
}

protocol MarketListViewModelDelegate : AnyObject {
    func handleViewModelOutput(_ output: MarketListViewModelOutput)
    func marketDetailSceneRouter(_ router: MarketDetailRouter)
}

enum MarketDetailRouter {
    case marketDetailId(_ viewModel: MarketDetailViewModel)
}
