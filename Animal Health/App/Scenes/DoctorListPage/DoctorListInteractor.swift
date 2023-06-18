//
//  DoctorListInteractor.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import Foundation

class DoctorListInteractor: DoctorListInteractorInputProtocol {
    
    weak var presenter: DoctorListInteractorOutputProtocol?
  
    let repo: DoctorRepository
    init (repo: DoctorRepository = DoctorRepositoryImpl()){
        self.repo = repo
    }
    func getDoctorList(pageNum: Int, keyword: String) {
        repo.getDoctorList(pageNum: pageNum, keyword: keyword) {  [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.presenter?.getDoctorListSuccessfully(doctorModel: response)
            case .failure(let error):
                self.presenter?.didnotgetDoctorList(error: error)
            }
            
        }
    }
  
}
