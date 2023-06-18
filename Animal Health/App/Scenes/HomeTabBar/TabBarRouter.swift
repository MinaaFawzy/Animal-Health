//
//  TabBarRouter.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import UIKit

class TabBarRouter: TabBarRouterProtocol{
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = TabBarVC()
        let interactor = TabBarInteractor()
        let router = TabBarRouter()
        let presenter = TabBarPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
}
