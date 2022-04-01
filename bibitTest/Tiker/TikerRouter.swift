//
//  TikerRouter.swift
//  bibitTest
//
//  Created by harrie yusuf on 31/03/22.
//

import Foundation
import UIKit

final class TikerRouter {
    private(set) var vc: UIViewController!
    
    init() {
        let presenter = TikerPresenter(interactor: TikerInteractor())
        vc = TikerViewController(presenter: presenter)
        if let vc = vc as? TikerViewInterface {
            presenter.view = vc
        }
    }
}
