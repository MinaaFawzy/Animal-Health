//
//  LoginRouter.swift
//  Animal Health App
//
//  Created by MoOoN on 30/08/2022.
//  
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    
    weak var viewController: LoginVC?
    
    static func createModule() -> UIViewController {
        let view = LoginVC()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func goToCreateAccountScreen() {
        let register: UIViewController = RegisterRouter.createModule()
        viewController?.navigationController?.pushViewController(register, animated: true)
    }
    
    func goToHomeScreen() {
        let homeVc = TabBarRouter.createModule()
        viewController?.navigationController?.pushViewController(homeVc, animated: true)
    }

}
