//
//  MarketListContracts.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

protocol MarketListViewModelProtocol {
    var delegate : MarketListViewModelDelegate? { get set }
    var market: [MarketPresentation] { get set }
    func loadData()
    func refreshData()
}

enum MarketListViewModelOutput: Equatable {
    case setLoading(Bool)
    case error(NetworkErrors)
    case showMarketList
}

protocol MarketListViewModelDelegate : AnyObject {
    func handleViewModelOutput(_ output: MarketListViewModelOutput)
}
