//
//  TeleconsultationRouter.swift
//  Animal Health App
//
//  Created by OSX on 06/09/2022.
//  
//

import UIKit

class TeleconsultationRouter: TeleconsultationRouterProtocol{
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = TeleconsultationVC()
        let interactor = TeleconsultationInteractor()
        let router = TeleconsultationRouter()
        let presenter = TeleconsultationPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func goBackToMyBooking() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
}
