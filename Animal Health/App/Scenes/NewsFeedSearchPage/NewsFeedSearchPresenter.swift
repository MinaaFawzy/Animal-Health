//
//  NewsFeedSearchPresenter.swift
//  Animal Health App
//
//  Created by OSX on 04/09/2022.
//  
//

import Foundation

class NewsFeedSearchPresenter: NewsFeedSearchPresenterProtocol, NewsFeedSearchInteractorOutputProtocol {
    
    weak var view: NewsFeedSearchViewProtocol?
    private let interactor: NewsFeedSearchInteractorInputProtocol
    private let router: NewsFeedSearchRouterProtocol
    var searchedNews: [NewsFeed] = []
    var totalPages: Int = 0
    var currentPage: Int = 1
    
    
    
    init(view: NewsFeedSearchViewProtocol, interactor: NewsFeedSearchInteractorInputProtocol, router: NewsFeedSearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Presenter
    func searchButonWasPressed(keyWord: String, page pageNum: Int) {
        if keyWord != ""{
            interactor.getNewsFeedAfterSearch(keyWord: keyWord, page: pageNum)
        } else {
            view?.makeAlert("Enter value in search bar")
            view?.stopLoadingData()
        }
    }
    
    func backButtonWasPressed() {
        router.backToHomePage()
    }
    
    func newsDetailsWasPressed(articleDetails: NewsFeed) {
        router.goToNewsDetails(articleDetails: articleDetails)
    }
  
    //MARK: - Interactor
    func newsFeedReturnSuccessfully(items: ArticlesPost) {
        searchedNews += items.articlesPosts!
        if searchedNews.count == 0 {
            view?.makeAlert("Search Didnot Found any Thing")
        }
        totalPages = items.totalPages
        currentPage = items.currentPage
        view?.stopLoadingData()
        view?.reloadData()
    }
    
    func newsFeedFalidToReturn(error: Error) {
        view?.stopLoadingData()
        router.goToErrorPage()
    }
    
}
