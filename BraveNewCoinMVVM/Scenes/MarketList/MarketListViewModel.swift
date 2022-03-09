//
//  MarketListViewModel.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation


final class MarketListViewModel : MarketListViewModelProtocol {
    weak var delegate : MarketListViewModelDelegate?
    private let service : NetworkServiceProtocol
    var marketList: [MarketPresentation] = []
    init(service : NetworkServiceProtocol) {
        self.service = service
    }
    
    func loadData() {
        delegate?.handleViewModelOutput(.setLoading(true))
        
        service.fetchMarketList {[weak self] (result) in
            guard let self = self else { return }
            self.delegate?.handleViewModelOutput(.setLoading(false))
            
            switch result {
            case .success(let response):
                self.marketList = response.market.map { MarketPresentation(market: $0) }
                self.delegate?.handleViewModelOutput(.showMarketList)
            case .failure(let error):
                self.delegate?.handleViewModelOutput(.error(error))
            }
        }
    }
    
    func selectMarket(at index: Int) {
        let market = marketList[index].id
        let viewModel = MarketDetailViewModel(id: market, service: appContainer.service)
        delegate?.marketDetailSceneRouter(.marketDetailId(viewModel))
    }
    
    func refreshData() {
        marketList.removeAll()
        loadData()
    }
}
