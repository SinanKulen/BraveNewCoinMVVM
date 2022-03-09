//
//  AssetDetailViewModel.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 7.03.2022.
//

import Foundation

final class AssetDetailViewModel : AssetDetailViewModelProtocol {
    var assetDetail: AssetDetailPresentation!
    weak var delegate: AssetDetailViewModelDelegate?
    private let service : NetworkServiceProtocol
    private var id : String
    init(id: String, service: NetworkServiceProtocol)
    {
        self.id = id
        self.service = service
    }

    func loadData() {
        delegate?.handleViewModelOutput(.setLoading(true))

        service.fetchAssetDetail(id: id) { (result) in
            self.delegate?.handleViewModelOutput(.setLoading(false))

            switch result
            {
            case .success(let response):
                self.assetDetail = AssetDetailPresentation(assetDetail: response)
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
