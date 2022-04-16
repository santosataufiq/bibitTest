//
//  TikerPresenter.swift
//  bibitTest
//
//  Created by harrie yusuf on 31/03/22.
//

import Foundation
import UIKit

protocol TikerPresenterInterface {
    func load()
}

final class TikerPresenter: Presenter, TikerPresenterInterface {
    var view: View?
    
    private let interactor: TikerInteractorInterface
    
    init(interactor: TikerInteractorInterface) {
        self.interactor = interactor
    }
    
    func load() {
        interactor.loadData { result in
            switch result {
            case .error(let errorMessage):
                break
            case .success(let apiTickers):
                let tickers = apiTickers.map {
                    $0.toDomain()
                }
                
                self.showList(tickers)
            }
        }
    }
}
