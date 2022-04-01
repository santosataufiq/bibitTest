//
//  MockTickerPresenter.swift
//  bibitTestUITests
//
//  Created by harrie yusuf on 01/04/22.
//

@testable import bibitTest

final class MockTikerPresenter: TikerPresenterInterface {
    var isLoadCalled = false
    
    func load() {
        isLoadCalled = true
    }
}
