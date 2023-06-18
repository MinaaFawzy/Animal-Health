//
//  PreviousBookingRouter.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//  
//

import UIKit

class PreviousBookingRouter: PreviousBookingRouterProtocol{
    
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = PreviousBookingVC()
        let interactor = PreviousBookingInteractor()
        let router = PreviousBookingRouter()
        let presenter = PreviousBookingPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func goBackToMyBooking() {
        viewController?.navigationController?.popViewController(animated: true)
    }
   
    func goToErrorPage() {
        let errorVC = ErrorPageRouter.createModule()
        errorVC.modalPresentationStyle = .fullScreen
        viewController?.present(errorVC, animated: true)
    }

}
