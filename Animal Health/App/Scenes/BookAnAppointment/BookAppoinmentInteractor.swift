//
//  BookAppoinmentInteractor.swift
//  Animal Health App
//
//  Created by OSX on 05/09/2022.
//  
//

import Foundation

class BookAppoinmentInteractor: BookAppoinmentInteractorInputProtocol {
    
    weak var presenter: BookAppoinmentInteractorOutputProtocol?
    
    let repo: ScheduleSlotsRepository
    init(repo: ScheduleSlotsRepository = ScheduleSlotsRepositoryImpl()){
        self.repo = repo
    }
    
    func getAllDays(doctorId: String) {
        repo.getAllAvailableDays(doctorId: doctorId) {  [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.presenter?.getAllDaysSuccessfully(item: response)
            case .failure(let error):
                self.presenter?.didnotGetAllDays(error: error)
            }
        }
    }
    
}
