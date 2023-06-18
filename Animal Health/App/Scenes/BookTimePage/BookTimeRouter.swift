//
//  BookTimeRouter.swift
//  Animal Health App
//
//  Created by OSX on 05/09/2022.
//  
//

import UIKit

class BookTimeRouter: BookTimeRouterProtocol{
  
    static var view: BookTimeViewProtocol?
    
    weak var viewController: UIViewController?
    
    static func createModule(date: String, doctorInfo: Doctor) -> UIViewController {
        let view = BookTimeVC()
        let interactor = BookTimeInteractor()
        let router = BookTimeRouter()
        let presenter = BookTimePresenter(view: view, interactor: interactor, router: router, date: date, doctorInfo: doctorInfo)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func backToBookAppointment() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func GoToTabBar() {
        let alert = UIAlertController(title: "", message: "Booking Done Successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
           
            guard let homeVc = self.viewController?.navigationController?.viewControllers.first(where: { VC in
                VC is TabBarVC
            }) else {return}
            self.viewController?.navigationController?.popToViewController(homeVc, animated: true)
        }))
        viewController?.present(alert, animated: true)
        }
    func goToErrorPage() {
        let errorVC = ErrorPageRouter.createModule()
        errorVC.modalPresentationStyle = .fullScreen
        viewController?.present(errorVC, animated: true)
    }

    
}
