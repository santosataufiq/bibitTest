//
//  MockTikerInteractor.swift
//  bibitTestTests
//
//  Created by harrie yusuf on 01/04/22.
//

@testable import bibitTest

final class MockTikerInteractor: TikerInteractorInterface {
    var isSuccess = false
    var mockTikers: [ApiTiker] = []
    
    func loadData(result: @escaping (ApiResult<[ApiTiker]>) -> Void) {
        if isSuccess {
            result(.success(mockTikers))
        } else {
            result(.error(""))
        }
    }
}
