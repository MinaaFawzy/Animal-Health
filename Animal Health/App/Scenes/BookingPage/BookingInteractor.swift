//
//  BookingInteractor.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import Foundation

class BookingInteractor: BookingInteractorInputProtocol {
    
    weak var presenter: BookingInteractorOutputProtocol?
    
    let repo: BookingRepository
    init(repo: BookingRepository = BookingRepositoryImpl()){
        self.repo = repo
    }
    func getBookingData() {
        repo.getBookingData {  [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.presenter?.getBookingDataSuccessfully(item: response)
            case .failure(let error):
                self.presenter?.didnotGetBookingData(error: error)
            }
            
        }
    }
   
}
