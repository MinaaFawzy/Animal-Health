//
//  RegisterRouter.swift
//  Animal Health App
//
//  Created by MoOoN on 30/08/2022.
//  
//

import UIKit

class RegisterRouter: RegisterRouterProtocol{
    
    weak var viewController: RegisterVC?
    
    static func createModule() -> UIViewController {
        let view = RegisterVC()
        let interactor = RegisterInteractor()
        let router = RegisterRouter()
        let presenter = RegisterPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func goBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func goToVerifyMobileNum(phoneNumber: String) {
        let verifyVC = VerifyingRouter.createModule(phoneNum: phoneNumber)
        viewController?.navigationController?.pushViewController(verifyVC, animated: true)
    }
   
}
