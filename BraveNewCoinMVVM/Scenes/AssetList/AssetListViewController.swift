//
//  AssetListViewController.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import UIKit

final class AssetListViewController: BaseViewController {

    private enum Constants {
        
        static let baseTableViewCellIdentifier = "BaseTableViewCell"
    }
    
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
        tableView.register(UINib(nibName: Constants.baseTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.baseTableViewCellIdentifier)
    }

    private func configureRefreshController() {
        refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    @objc private func refresh() {
        viewModel.refreshData()
        tableView.reloadData()
        refreshController.endRefreshing()
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
    
    func assetDetailSceneRouter(_ router: AssetDetailRouter) {
        switch router {
        case .assetDetailId(let detailViewModel):
            let vc = AssetDetailSceneBuilder.build(with: detailViewModel)
            show(vc, sender: nil)
        }
    }
}

extension AssetListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.assetList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.baseTableViewCellIdentifier,for: indexPath) as? BaseTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = viewModel.assetList[indexPath.row].name
        return cell
    }
}

extension AssetListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectAsset(at: indexPath.row)
    }
}
