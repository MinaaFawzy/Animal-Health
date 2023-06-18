//
//  BookAppoinmentRouter.swift
//  Animal Health App
//
//  Created by OSX on 05/09/2022.
//  
//

import UIKit

class BookAppoinmentRouter: BookAppoinmentRouterProtocol{
    
    weak var viewController: UIViewController?
    
    static func createModule(doctorInfo: Doctor) -> UIViewController {
        let view = BookAppoinmentVC()
        let interactor = BookAppoinmentInteractor()
        let router = BookAppoinmentRouter()
        let presenter = BookAppoinmentPresenter(view: view, interactor: interactor, router: router, doctorInfo: doctorInfo)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
 
    func goBackToHome() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func goToSelectTime(date:String, doctorInfo: Doctor) {
        let bookTimeVC = BookTimeRouter.createModule(date: date, doctorInfo: doctorInfo)
        viewController?.navigationController?.pushViewController(bookTimeVC, animated: true)
    }
    func goToErrorPage() {
        let errorVC = ErrorPageRouter.createModule()
        errorVC.modalPresentationStyle = .fullScreen
        viewController?.present(errorVC, animated: true)
    }

 
}
