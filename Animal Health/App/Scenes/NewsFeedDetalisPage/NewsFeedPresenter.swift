//
//  NewsFeedPresenter.swift
//  Animal Health App
//
//  Created by OSX on 07/09/2022.
//  
//

import Foundation

class NewsFeedPresenter: NewsFeedPresenterProtocol, NewsFeedInteractorOutputProtocol {
    
    weak var view: NewsFeedViewProtocol?
    private let interactor: NewsFeedInteractorInputProtocol
    private let router: NewsFeedRouterProtocol
    private(set) var newsDetails: NewsFeed
    private(set) var articleDetails: ArticleDetails?
    
    init(view: NewsFeedViewProtocol, interactor: NewsFeedInteractorInputProtocol, router: NewsFeedRouterProtocol, newsDetails: NewsFeed) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.newsDetails = newsDetails
    }
    
    func backButtonWasPressed() {
        router.goBackToHomePage()
    }
   
    func getNewsdetailsSuccessfully(item: ArticleDetails) {
        articleDetails = item
    }
    
    func didnotGetNewsDetails(error: Error) {
        router.goToErrorPage()
        print(error)
    }
    func viewDidLoad() {
        interactor.getNewsDetails(id: newsDetails.id ?? 0)
    }
   

}
