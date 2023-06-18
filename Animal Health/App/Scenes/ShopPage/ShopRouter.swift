//
//  ShopRouter.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import UIKit

class ShopRouter: ShopRouterProtocol{
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = ShopVC()
        let interactor = ShopInteractor()
        let router = ShopRouter()
        let presenter = ShopPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
}
