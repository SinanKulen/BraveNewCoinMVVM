//
//  MarketListViewController.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import UIKit

final class MarketListViewController: BaseViewController {
    
    private enum Constants {
        static let baseTableViewCellIdentifier = "BaseTableViewCell"
    }
    
    @IBOutlet private var tableView: UITableView!
    var viewModel : MarketListViewModelProtocol! {
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

extension MarketListViewController : MarketListViewModelDelegate {
    func handleViewModelOutput(_ output: MarketListViewModelOutput) {
        DispatchQueue.main.async {
            switch output {
            case .setLoading(let loading):
                self.setActivityIndıcatorAnimation(with: loading)
            case .error(let error):
                self.showAlert(with: "Error", error.rawValue)
            case .showMarketList:
                self.tableView.reloadData()
            }
        }
    }
    
    func marketDetailSceneRouter(_ router: MarketDetailRouter) {
        switch router {
        case .marketDetailId(let detailViewModel):
            let vc = MarketDetailSceneBuilder.build(with: detailViewModel)
            show(vc, sender: nil)
        }
    }
}

extension MarketListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.marketList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.baseTableViewCellIdentifier,for: indexPath) as? BaseTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = viewModel.marketList[indexPath.row].id
        return cell
    }
}

extension MarketListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectMarket(at: indexPath.row)

    }
}
