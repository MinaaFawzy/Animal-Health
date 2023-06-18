//
//  NewsFeedRouter.swift
//  Animal Health App
//
//  Created by OSX on 07/09/2022.
//  
//

import UIKit

class NewsFeedRouter: NewsFeedRouterProtocol{
    
    weak var viewController: UIViewController?
    
    static func createModule(newsDetails: NewsFeed) -> UIViewController {
        let view = NewsFeedVC()
        let interactor = NewsFeedInteractor()
        let router = NewsFeedRouter()
        let presenter = NewsFeedPresenter(view: view, interactor: interactor, router: router, newsDetails: newsDetails )
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func goBackToHomePage() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    func goToErrorPage() {
        let errorVC = ErrorPageRouter.createModule()
        errorVC.modalPresentationStyle = .fullScreen
        viewController?.present(errorVC, animated: true)
    }
    
    
}
