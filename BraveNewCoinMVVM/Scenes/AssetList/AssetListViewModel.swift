//
//  AssetListViewModel.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

final class AssetListViewModel : AssetListViewModelProtocol {
    weak var delegate : AssetListViewModelDelegate?
    private let service : BNCServiceProtocol
    var asset : [AssetPresentation] = []
    init(service : BNCServiceProtocol) {
        self.service = service
    }
    
    func loadData() {
        delegate?.handleViewModelOutput(.setLoading(true))
        
        service.fetchAsset {[weak self] (result) in
            guard let self = self else { return }
            self.delegate?.handleViewModelOutput(.setLoading(false))
            
            switch result
            {
            case .success(let response):
                self.asset = response.asset.map{ AssetPresentation(asset: $0) }
                self.delegate?.handleViewModelOutput(.showAssetList)
            case .failure(let error):
                self.delegate?.handleViewModelOutput(.error(error))
            }
        }
    }
    
    func refreshData() {
        asset.removeAll()
        loadData()
    }
}
