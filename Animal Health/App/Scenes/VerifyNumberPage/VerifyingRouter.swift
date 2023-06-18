//
//  VerifyingRouter.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import UIKit

class VerifyingRouter: VerifyingRouterProtocol{
    
    weak var viewController: VerifyingVC?
    
    static func createModule(phoneNum: String) -> UIViewController {
        let view = VerifyingVC()
        let interactor = VerifyingInteractor()
        let router = VerifyingRouter()
        let presenter = VerifyingPresenter(
            view: view,
           interactor: interactor,
            router: router,
            phoneNum: phoneNum
        )
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
   
    func goBackToCreateAccount() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func goToLoginPage() {
        let loginVc = LoginRouter.createModule()
        viewController?.navigationController?.pushViewController(loginVc, animated: true)
    }
   
}
