//
//  MarketDetailViewController.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 5.03.2022.
//

import UIKit

final class MarketDetailViewController: BaseViewController {
    
    @IBOutlet private var marketId: UILabel!
    @IBOutlet private var baseId: UILabel!
    @IBOutlet private var quoteId: UILabel!
    var viewModel : MarketDetailViewModelProtocol!{
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
        configureRefreshController()
    }
    
    private func configureRefreshController() {
        refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    @objc private func refresh()
    {
        viewModel.refreshData()
        refreshController.endRefreshing()
    }
}

extension MarketDetailViewController : MarketDetailViewModelDelegate {
    func handleViewModelOutput(_ output: MarketDetailViewModelOutput)
    {
        DispatchQueue.main.async {
            switch output {
            case .setLoading(let loading):
                self.setActivityIndıcatorAnimation(with: loading)
            case .error(let error):
                self.showAlert(with: "Error!!!", error.rawValue)
            case .showMarketDetail:
                self.configureRefreshController()
                self.marketId.text = self.viewModel.marketDetail.id
                self.baseId.text = self.viewModel.marketDetail.baseAssetId
                self.quoteId.text = self.viewModel.marketDetail.quoteAssetId
                
            }
        }
    }
}
