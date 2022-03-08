//
//  MarketDetailContracts.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 5.03.2022.
//

import Foundation

protocol MarketDetailViewModelProtocol {
    var delegate : MarketDetailViewModelDelegate? { get set }
    var marketDetail : MarketDetailPresentation! { get set }
    func loadData()
    func refreshData()
}

enum MarketDetailViewModelOutput {
    case setLoading(Bool)
    case error(NetworkErrors)
    case showMarketDetail
}

protocol MarketDetailViewModelDelegate : AnyObject {
    func handleViewModelOutput(_ output: MarketDetailViewModelOutput)
}
