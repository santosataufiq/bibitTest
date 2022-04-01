//
//  MockTikerView.swift
//  bibitTestTests
//
//  Created by harrie yusuf on 01/04/22.
//

import Foundation
@testable import bibitTest

final class MockTikerView: TikerViewInterface {
    var tikers: [Tiker] = []
    
    func presentData(_ tickers: [Tiker]) {
        self .tikers = tickers
    }
}
