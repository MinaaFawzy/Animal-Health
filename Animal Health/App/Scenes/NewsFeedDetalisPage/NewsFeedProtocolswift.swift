//
//  NewsFeedProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 07/09/2022.
//  
//

import Foundation

//MARK: - View
protocol NewsFeedViewProtocol: AnyObject {
    var presenter: NewsFeedPresenterProtocol! { get set }
}
//MARK: - Presenter
protocol NewsFeedPresenterProtocol: AnyObject {
    var view: NewsFeedViewProtocol? { get set }
    var newsDetails: NewsFeed { get }
    var articleDetails: ArticleDetails? { get }
    func backButtonWasPressed()
    func viewDidLoad()
}

//MARK: - Router
protocol NewsFeedRouterProtocol {
    func goBackToHomePage()
    func goToErrorPage()
}

//MARK: - Interactor
protocol NewsFeedInteractorInputProtocol {
    var presenter: NewsFeedInteractorOutputProtocol? { get set }
    func getNewsDetails(id: Int)
}

protocol NewsFeedInteractorOutputProtocol: AnyObject {
    func getNewsdetailsSuccessfully(item: ArticleDetails)
    func didnotGetNewsDetails(error: Error)
}
