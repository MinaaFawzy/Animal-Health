//
//  DoctorListRouter.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import UIKit

class DoctorListRouter: DoctorListRouterProtocol{
  
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = DoctorListVC()
        let interactor = DoctorListInteractor()
        let router = DoctorListRouter()
        let presenter = DoctorListPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    func goBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func goToBookingPage(doctorInfo: Doctor) {
        let bookingVC = BookAppoinmentRouter.createModule(doctorInfo: doctorInfo)
        viewController?.navigationController?.pushViewController(bookingVC, animated: true)
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
