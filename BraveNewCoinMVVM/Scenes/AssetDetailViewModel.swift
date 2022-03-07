//
//  AssetDetailViewModel.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 7.03.2022.
//

import Foundation

final class AssetDetailViewModel : AssetDetailViewModelProtocol
{
    var assetDetail: AssetDetailPresentation!
    weak var delegate: AssetListViewModelDelegate?
    private let service : BNCServiceProtocol
    init(service: BNCServiceProtocol)
    {
        self.service = service
    }
    
    func loadData()
    {
        delegate?.handleViewModelOutput(.setLoading(true))
        
        service.fetchAssetDetail { (result) in
            self.delegate?.handleViewModelOutput(.setLoading(false))
            
            switch result
            {
            case .success(let response):
                self.assetDetail = AssetDetailPresentation(assetDetail: response.assetDetail)
                self.delegate?.handleViewModelOutput(.showAssetList)
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
