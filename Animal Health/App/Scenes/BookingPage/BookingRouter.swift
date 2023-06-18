//
//  BookingRouter.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import UIKit

class BookingRouter: BookingRouterProtocol{
    
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = BookingVC()
        let interactor = BookingInteractor()
        let router = BookingRouter()
        let presenter = BookingPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func goToTeleconsultation() {
        let teleconsultationVC = TeleconsultationRouter.createModule()
        viewController?.navigationController?.pushViewController(teleconsultationVC, animated: true)
    }
    
    func goToPreviousBookingPage() {
        let previousVC = PreviousBookingRouter.createModule()
        viewController?.navigationController?.pushViewController(previousVC, animated: true)
    }
   
    func goToErrorPage() {
        let errorVC = ErrorPageRouter.createModule()
        errorVC.modalPresentationStyle = .fullScreen
        viewController?.present(errorVC, animated: true)
    }
    
    func goToLoginPage() {
        let loginVC = LoginRouter.createModule()
        viewController?.navigationController?.setViewControllers([loginVC], animated: true)
    }
    
}
