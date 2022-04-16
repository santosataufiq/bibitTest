//
//  Presenter.swift
//  bibitTest
//
//  Created by harrie yusuf on 16/04/22.
//

import Foundation

protocol DomainData {
    
}

protocol View: AnyObject {
    func presentData(_ data: DomainData)
    func presentListData(_ data: [DomainData])
}

protocol Presenter {
    var view: View? { get set }
    
    func load()
}

extension Presenter {
    func show(_ data: DomainData) {
        DispatchQueue.main.async {
            view?.presentData(data)
        }
    }
    
    func showList(_ data: [DomainData]) {
        DispatchQueue.main.async {
            view?.presentListData(data)
        }
    }
}
