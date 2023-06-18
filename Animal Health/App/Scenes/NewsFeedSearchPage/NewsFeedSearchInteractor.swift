//
//  NewsFeedSearchInteractor.swift
//  Animal Health App
//
//  Created by OSX on 04/09/2022.
//  
//

import Foundation

class NewsFeedSearchInteractor: NewsFeedSearchInteractorInputProtocol {
   
    weak var presenter: NewsFeedSearchInteractorOutputProtocol?
    
    let repo: HomeRepository
    init(repo: HomeRepository = HomeRepositoryImpl()) {
        self.repo = repo
    }
    
    func getNewsFeedAfterSearch(keyWord: String, page: Int) {
        repo.getSearchedNewsFeed(keyword: keyWord, page: page) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case.success(let items):
                self.presenter?.newsFeedReturnSuccessfully(items: items)
            case.failure(let error):
                self.presenter?.newsFeedFalidToReturn(error: error)
            }
        }
    }
   
}
