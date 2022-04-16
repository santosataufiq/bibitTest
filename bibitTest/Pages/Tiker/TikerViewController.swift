//
//  TikerViewController.swift
//  bibitTest
//
//  Created by harrie yusuf on 31/03/22.
//

import UIKit

final class TikerViewController: UITableViewController {
    private let presenter: TikerPresenterInterface
    private var tickers: [Tiker] = []
    
    init(presenter: TikerPresenterInterface) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        presenter.load()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TickerCell.self,
                           forCellReuseIdentifier: String(describing: TickerCell.self))
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TickerCell.self), for: indexPath) as? TickerCell,
              indexPath.row < tickers.count else {
            return UITableViewCell()
        }
        
        let ticker = tickers[indexPath.row]
        
        cell.set(name: ticker.name,
                 fullName: ticker.fullName,
                 currency: String(ticker.maxSupply),
                 percentage: String(ticker.blockNumber))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickers.count
    }
}

extension TikerViewController: View {
    func presentData(_ data: DomainData) {
        
    }
    
    func presentListData(_ data: [DomainData]) {
        guard let tickers = data as? [Tiker] else {
            return
        }
        
        self.tickers = tickers
        tableView.reloadData()
    }
}
