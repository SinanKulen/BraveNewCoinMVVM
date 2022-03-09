//
//  AssetListViewModel.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import Foundation

final class AssetListViewModel : AssetListViewModelProtocol {
    weak var delegate : AssetListViewModelDelegate?
    private let service : NetworkServiceProtocol
    var assetList : [AssetPresentation] = []
    init(service : NetworkServiceProtocol) {
        self.service = service
    }
    
    func loadData() {
        delegate?.handleViewModelOutput(.setLoading(true))
        
        service.fetchAssetList {[weak self] (result) in
            guard let self = self else { return }
            self.delegate?.handleViewModelOutput(.setLoading(false))
            
            switch result
            {
            case .success(let response):
                self.assetList = response.asset.map{ AssetPresentation(asset: $0) }
                self.delegate?.handleViewModelOutput(.showAssetList)
            case .failure(let error):
                self.delegate?.handleViewModelOutput(.error(error))
            }
        }
    }
    
    func selectAsset(at index: Int) {
        let asset = assetList[index].id
        let viewModel = AssetDetailViewModel(id: asset, service: appContainer.service)
        delegate?.assetDetailSceneRouter(.assetDetailId(viewModel))
    }
    
    func refreshData() {
        assetList.removeAll()
        loadData()
    }
}
