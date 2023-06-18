//
//  HomeProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import Foundation

//MARK: - View
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol! { get set }
    func reloadData()
    func makeAlert(_ errorMassage: String)
    func stopLoadingData()
}

//MARK: - Presenter
protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var newsFeed: [NewsFeed] { get set}
    var totalePages: Int { get }
    var currentPage: Int { get }
    
    func searchButtonWasPressed()
    func bookDoctorButtonWasPressed()
    func articleWasSelected(articleDetails: NewsFeed)
    func viewDidLoad(pageNum: Int)
    
}

//MARK: - Router
protocol HomeRouterProtocol {
    func goToSearchPage()
    func goToBookinPage()
    func goToArticleDetails(newsDetails: NewsFeed)
    func goToErrorPage()
}

//MARK: - Interactor
protocol HomeInteractorInputProtocol {
    var presenter: HomeInteractorOutputProtocol? { get set }
    func getNewsFeed(page: Int)
}

protocol HomeInteractorOutputProtocol: AnyObject {
    
    func newsFeedReturnSuccessfully(items: ArticlesPost)
    func newsFeedFalidToReturn(error: Error)
    
}
