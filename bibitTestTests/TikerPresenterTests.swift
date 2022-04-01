//
//  TikerPresenterTests.swift
//  bibitTestTests
//
//  Created by harrie yusuf on 01/04/22.
//

@testable import bibitTest
import XCTest

final class TikerPresenterTests: XCTestCase {
    let generator = Generator()
    var sut: TikerPresenter!
    var mockInteractor: MockTikerInteractor!
    var mockView: MockTikerView!
    
    override func setUp() {
        mockView = MockTikerView()
        mockInteractor = MockTikerInteractor()
        sut = TikerPresenter(interactor: mockInteractor)
        sut.view = mockView
    }
    
    func testSuccessLoad() {
        let mockTiker = generator.apiTiker()
        mockInteractor.mockTikers = [mockTiker]
        mockInteractor.isSuccess = true
        
        sut.load()
        
        XCTAssertEqual(mockView.tikers.first?.name, mockTiker.coinInfo.name)
    }
    
    func testFailLoad() {
        mockInteractor.isSuccess = false
        
        sut.load()
        
        XCTAssertTrue(mockView.tikers.isEmpty)
    }
}
