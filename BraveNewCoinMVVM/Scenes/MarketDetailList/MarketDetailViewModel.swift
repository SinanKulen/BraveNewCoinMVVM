//
//  MarketDetailViewModel.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 5.03.2022.
//

import Foundation

final class MarketDetailViewModel: MarketDetailViewModelProtocol
{
    var  marketDetail: MarketDetailPresentation!
    weak var delegate : MarketDetailViewModelDelegate?
    private let service : BNCServiceProtocol
    init(service: BNCServiceProtocol)
    {
        self.service = service
    }
    
    func loadData()
    {
        delegate?.handleViewModelOutput(.setLoading(true))
        
        service.fetchMarketDetail {(result) in
            self.delegate?.handleViewModelOutput(.setLoading(false))
            
            switch result
            {
            case .success(let response):
                self.marketDetail = MarketDetailPresentation(marketDetail: response.marketDetail)
                self.delegate?.handleViewModelOutput(.showMarketDetail)
            case .failure(let error):
                self.delegate?.handleViewModelOutput(.error(error))
            }
        }
    }
    
    func refreshData()
    {
        loadData()
    }
}
