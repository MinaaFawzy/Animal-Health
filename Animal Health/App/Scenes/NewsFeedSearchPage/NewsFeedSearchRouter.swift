//
//  NewsFeedSearchRouter.swift
//  Animal Health App
//
//  Created by OSX on 04/09/2022.
//  
//

import UIKit

class NewsFeedSearchRouter: NewsFeedSearchRouterProtocol{
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = NewsFeedSearchVC()
        let interactor = NewsFeedSearchInteractor()
        let router = NewsFeedSearchRouter()
        let presenter = NewsFeedSearchPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func backToHomePage() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    func goToNewsDetails(articleDetails: NewsFeed) {
        let newsDetailsVC = NewsFeedRouter.createModule(newsDetails: articleDetails)
        viewController?.navigationController?.pushViewController(newsDetailsVC, animated: true)
    }
    func goToErrorPage() {
        let errorVC = ErrorPageRouter.createModule()
        errorVC.modalPresentationStyle = .fullScreen
        viewController?.present(errorVC, animated: true)
    }
  
    
}
