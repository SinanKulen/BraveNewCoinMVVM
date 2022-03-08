//
//  AssetListViewController.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import UIKit

final class AssetListViewController: BaseViewController {

    @IBOutlet private var tableView: UITableView!
    var viewModel : AssetListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
        tableView.refreshControl = refreshController
        configureRefreshController()
        tableView.register(UINib(nibName: "BaseTableViewCell", bundle: nil), forCellReuseIdentifier: "BaseTableViewCell")
    }
    
    private func configureRefreshController() {
        refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    @objc private func refresh() {
        viewModel.refreshData()
        tableView.reloadData()
        refreshController.endRefreshing()
    }
    
    func buildAssetDetailVC() {
        let vc = AssetDetailSceneBuilder.build()
        show(vc, sender: nil)
    }
}

extension AssetListViewController : AssetListViewModelDelegate {
    func handleViewModelOutput(_ output: AssetListViewModelOutput) {
        DispatchQueue.main.async {
            switch output {
            case .setLoading(let loading):
                self.setActivityIndıcatorAnimation(with: loading)
            case .error(let error):
                self.showAlert(with: "Error", error.rawValue)
            case .showAssetList:
                self.tableView.reloadData()
            }
        }
    }
}

extension AssetListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.asset.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BaseTableViewCell",for: indexPath) as? BaseTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = viewModel.asset[indexPath.row].name
        return cell
    }
}

extension AssetListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AssetId.assetid = viewModel.asset[indexPath.row].id
        buildAssetDetailVC()
    }
}
