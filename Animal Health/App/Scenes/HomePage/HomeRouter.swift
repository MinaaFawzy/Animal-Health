//
//  HomeRouter.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import UIKit

class HomeRouter: HomeRouterProtocol{
  
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = HomeVC()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func goToSearchPage() {
        let searchVC = NewsFeedSearchRouter.createModule()
        viewController?.navigationController?.pushViewController(searchVC, animated: true)
        
    }
    
    func goToBookinPage() {
        let bookingVC = DoctorListRouter.createModule()
        viewController?.navigationController?.pushViewController(bookingVC, animated: true)
    
    }
    func goToArticleDetails(newsDetails: NewsFeed) {
        let newsDetailsVC = NewsFeedRouter.createModule(newsDetails: newsDetails)
        viewController?.navigationController?.pushViewController(newsDetailsVC, animated: true)
    }
    
    func goToErrorPage() {
        let errorVC = ErrorPageRouter.createModule()
        errorVC.modalPresentationStyle = .fullScreen
        viewController?.present(errorVC, animated: true)
        
    }
  
}
