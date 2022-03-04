//
//  MarketListViewModel.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation


final class MarketListViewModel : MarketListViewModelProtocol
{
   
    weak var delegate : MarketListViewModelDelegate?
    private let service : BNCServiceProtocol
    var market : [MarketPresentation] = []
    init(_ service : BNCServiceProtocol = BNCService())
    {
        self.service = service
    }
    
    func loadData()
    {
        delegate?.handleViewModelOutput(.setLoading(true))
        
        service.fetchMarket {[weak self] (result) in
            guard let self = self else { return }
            self.delegate?.handleViewModelOutput(.setLoading(false))
            
            switch result
            {
            case .success(let response):
                self.market = response.market.map{ MarketPresentation(market: $0) }
                self.delegate?.handleViewModelOutput(.showMarketList)
            case .failure(let error):
                self.delegate?.handleViewModelOutput(.error(error))
            }
        }
    }
    
    func refreshData()
    {
        market.removeAll()
        loadData()
    }
}
