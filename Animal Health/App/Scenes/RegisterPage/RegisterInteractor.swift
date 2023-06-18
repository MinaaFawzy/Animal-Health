//
//  RegisterInteractor.swift
//  Animal Health App
//
//  Created by MoOoN on 30/08/2022.
//  
//

import Foundation

class RegisterInteractor: RegisterInteractorInputProtocol {
    
    weak var presenter: RegisterInteractorOutputProtocol?
    let repo : UserRepository
    
    init(repo: UserRepository = UserRepositoryImpl()){
        self.repo = repo
    }
    
    func checkRegistration(
        userName: String,
        phoneNumber: String,
        password: String,
        confirmPassword: String
    ) {
        repo.addNewCustomer(
            name: userName,
            phoneNumber: phoneNumber,
            password: password
        ) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let respone):
                if respone.isSuccess ?? false {
                    self.presenter?.accountAreCreateSuccessfully(phoneNumber: phoneNumber)
                } else {
                    self.presenter?.accountDidnotCreate(error: ResponseError.invalidInput)
                }
            case .failure(let error):
                self.presenter?.accountDidnotCreate(error: error)
            }
        }
    }
    
}
