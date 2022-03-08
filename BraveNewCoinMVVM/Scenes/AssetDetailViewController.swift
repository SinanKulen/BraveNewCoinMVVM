//
//  AssetDetailViewController.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 7.03.2022.
//

import UIKit

final class AssetDetailViewController: BaseViewController {
    
    @IBOutlet private var idLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var symbolLabel: UILabel!
    @IBOutlet private var slugNameLabel: UILabel!
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var typeLabel: UILabel!
    @IBOutlet private var urlLabel: UILabel!
    @IBOutlet private var contractLabel: UILabel!
    
    var viewModel : AssetDetailViewModelProtocol!{
        didSet{
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
        configureRefreshController()
    }
    
    private func configureRefreshController()
    {
        refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    @objc func refresh()
    {
        viewModel.refreshData()
        refreshController.endRefreshing()
    }
}

extension AssetDetailViewController : AssetListViewModelDelegate {
    func handleViewModelOutput(_ output: AssetListViewModelOutput) {
        DispatchQueue.main.async {
            switch output {
            case .setLoading(let loading):
                self.setActivityIndıcatorAnimation(with: loading)
            case .error(let error):
                self.showAlert(with: "Error!!!", error.rawValue)
            case .showAssetList:
                self.configureRefreshController()
                self.idLabel.text = self.viewModel.assetDetail.id
                self.nameLabel.text = self.viewModel.assetDetail.name
                self.symbolLabel.text = self.viewModel.assetDetail.symbol
                self.slugNameLabel.text = self.viewModel.assetDetail.slugName
                self.statusLabel.text = self.viewModel.assetDetail.status
                self.typeLabel.text = self.viewModel.assetDetail.type
                self.urlLabel.text = (self.viewModel.assetDetail.url != nil) ? self.viewModel.assetDetail.url : ""
                self.contractLabel.text = (self.viewModel.assetDetail.contractAddress != nil) ? self.viewModel.assetDetail.contractAddress : ""
                
            }
        }
    }
    
    
}
