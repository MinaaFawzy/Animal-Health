//
//  HomeInteractor.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    
    weak var presenter: HomeInteractorOutputProtocol?
    let repo : HomeRepository
    init(repo: HomeRepository = HomeRepositoryImpl()){
        self.repo =  repo
    }
    
    func getNewsFeed(page: Int) {
        repo.getNewsFeed(page: page) { [weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let items):
                self.presenter?.newsFeedReturnSuccessfully(items: items)
            case .failure(let error):
                self.presenter?.newsFeedFalidToReturn(error: error)
            }
            
        }
    }
  
}
