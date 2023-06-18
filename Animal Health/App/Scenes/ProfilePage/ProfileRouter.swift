//
//  ProfileRouter.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import UIKit

class ProfileRouter: ProfileRouterProtocol{
    
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = ProfileVC()
        let interactor = ProfileInteractor()
        let router = ProfileRouter()
        let presenter = ProfilePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func goToLoginButton() {
        let loginVC = LoginRouter.createModule()
        viewController?.navigationController?.setViewControllers([loginVC], animated: true)
        UserDefaults.standard.setValue(nil, forKey: "token")
    }
 
}
