//
//  PreviousBookingInteractor.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//  
//

import Foundation

class PreviousBookingInteractor: PreviousBookingInteractorInputProtocol {
    
    weak var presenter: PreviousBookingInteractorOutputProtocol?
    
    let repo: BookingRepository
    init(repo: BookingRepository = BookingRepositoryImpl()){
        self .repo = repo
    }
    
    func getPreviousData(counter: Int) {
        repo.getPerviousBookingData(counter: counter) {  [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.presenter?.getPreviousDataSuccessfully(item: response)
            case .failure(let error):
                self.presenter?.didnotGetPreviousData(error: error)
            }
        }
    }
    
}
