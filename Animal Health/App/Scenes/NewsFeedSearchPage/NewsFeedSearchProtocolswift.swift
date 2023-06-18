//
//  NewsFeedSearchProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 04/09/2022.
//  
//

import Foundation

//MARK: - View
protocol NewsFeedSearchViewProtocol: AnyObject {
    var presenter: NewsFeedSearchPresenterProtocol! { get set }
    func makeAlert(_ errorMassage: String)
    func reloadData()
    func stopLoadingData()
}

//MARK: - Presenter
protocol NewsFeedSearchPresenterProtocol: AnyObject {
    var view: NewsFeedSearchViewProtocol? { get set }
    var searchedNews: [NewsFeed] { get set }
    var totalPages: Int { get }
    var currentPage: Int { set get }
    func searchButonWasPressed(keyWord: String, page: Int)
    func backButtonWasPressed()
    func newsDetailsWasPressed(articleDetails: NewsFeed)
}

//MARK: - Router
protocol NewsFeedSearchRouterProtocol {
    func backToHomePage()
    func goToNewsDetails(articleDetails: NewsFeed)
    func goToErrorPage()
    
    
}

//MARK: - Interactor
protocol NewsFeedSearchInteractorInputProtocol {
    var presenter: NewsFeedSearchInteractorOutputProtocol? { get set }
    func getNewsFeedAfterSearch(keyWord: String, page: Int)
}

protocol NewsFeedSearchInteractorOutputProtocol: AnyObject {
    func newsFeedReturnSuccessfully(items: ArticlesPost)
    func newsFeedFalidToReturn(error: Error)
}
