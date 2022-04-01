//
//  TikerViewControllerTests.swift
//  bibitTestUITests
//
//  Created by harrie yusuf on 01/04/22.
//

import XCTest
@testable import bibitTest

final class TikerViewControllerTests: XCTestCase {
    let generator = Generator()
    var sut: TikerViewController!
    var mockPresenter: MockTikerPresenter!
    
    override func setUp() {
        mockPresenter = MockTikerPresenter()
        sut = TikerViewController(presenter: mockPresenter)
    }
    
    func testLoadViewAlsoLoadPresenter() {
        sut.viewDidLoad()
        
        XCTAssertTrue(mockPresenter.isLoadCalled)
    }
    
    func testPresentData() {
        let mockTicker = generator.tiker()
        
        sut.presentData([mockTicker])
        
        if let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TickerCell {
            let nameLabel = cell.findWith(identifier: "nameLabel") as? UILabel
            XCTAssertEqual(nameLabel?.text, mockTicker.name)
        } else {
            XCTFail("cant find cell")
        }
    }
}

extension UIView {
    func findWith(identifier: String) -> UIView? {
        let view = subviews.first { $0.accessibilityIdentifier == identifier }
        
        if let view = view {
            return view
        } else {
            var view: UIView?
            
            for subview in subviews {
                view = subview.findWith(identifier: identifier)
                if view != nil {
                    break
                }
            }
            
            return view
        }
    }
}
