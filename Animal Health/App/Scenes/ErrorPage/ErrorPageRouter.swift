//
//  ErrorPageRouter.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//  
//

import UIKit

class ErrorPageRouter: ErrorPageRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = ErrorPageVC()
        let interactor = ErrorPageInteractor()
        let router = ErrorPageRouter()
        let presenter = ErrorPagePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func goBackToHome() {
        viewController?.dismiss(animated: true)
    }
    
}
