//
//  CartRouter.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import UIKit

class CartRouter: CartRouterProtocol{
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = CartVC()
        let interactor = CartInteractor()
        let router = CartRouter()
        let presenter = CartPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
}
