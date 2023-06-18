//
//  HomePresenter.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import Foundation

class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol {
  
    weak var view: HomeViewProtocol?
    private let interactor: HomeInteractorInputProtocol
    private let router: HomeRouterProtocol
    var newsFeed: [NewsFeed] = []
    var totalePages: Int = 0
    var currentPage: Int = 1
    
    init(view: HomeViewProtocol, interactor: HomeInteractorInputProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Presenter Functions
    func searchButtonWasPressed() {
        router.goToSearchPage()
    }
    func bookDoctorButtonWasPressed() {
        router.goToBookinPage()
    }
    func articleWasSelected(articleDetails: NewsFeed) {
        router.goToArticleDetails(newsDetails: articleDetails)
    }
    
    //MARK: - InterActorOutputs Functions
    func newsFeedReturnSuccessfully(items: ArticlesPost) {
        newsFeed += items.articlesPosts!
        view?.reloadData()
        totalePages = items.totalPages
        currentPage = items.currentPage
        view?.stopLoadingData()
    }
    func newsFeedFalidToReturn(error: Error) {
        router.goToErrorPage()
        view?.stopLoadingData()
    }
    func viewDidLoad(pageNum: Int) {
        interactor.getNewsFeed(page: pageNum)
    }
   
}
