//
//  NewsFeedInteractor.swift
//  Animal Health App
//
//  Created by OSX on 07/09/2022.
//  
//

import Foundation

class NewsFeedInteractor: NewsFeedInteractorInputProtocol {
    
    weak var presenter: NewsFeedInteractorOutputProtocol?
    let repo: HomeRepository
    init(repo: HomeRepository = HomeRepositoryImpl()){
        self.repo = repo
    }
    
    func getNewsDetails(id: Int) {
        repo.getNewsFeedDetails(id: id) {  [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.presenter?.getNewsdetailsSuccessfully(item: response)
            case .failure(let error):
                self.presenter?.didnotGetNewsDetails(error: error)
            } 
        }
    }
    
}
