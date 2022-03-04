//
//  MarketListViewController.swift
//  BraveNewCoinMVVM
//
//  Created by Sinan Kulen on 4.03.2022.
//

import UIKit

class MarketListViewController: BaseViewController
{
    @IBOutlet var tableView: UITableView!
    var viewModel : MarketListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
        //tableView.refreshControl
        configureRefreshController()
        tableView.register(UINib(nibName: "BaseTableViewCell", bundle: nil), forCellReuseIdentifier: "BaseTableViewCell")
    }
    
    private func configureRefreshController()
    {
        refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    @objc func refresh()
    {
        viewModel.refreshData()
        tableView.reloadData()
        refreshController.endRefreshing()
    }
}

extension MarketListViewController : MarketListViewModelDelegate
{
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
}

extension MarketListViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.market.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BaseTableViewCell",for: indexPath) as? BaseTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = viewModel.market[indexPath.row].id
        return cell
    }
}

extension MarketListViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
