//
//  LoginInteractor.swift
//  Animal Health App
//
//  Created by MoOoN on 30/08/2022.
//  
//

import Foundation

class LoginInteractor: LoginInteractorInputProtocol {
    
    weak var presenter: LoginInteractorOutputProtocol?
    let repo : UserRepository
    
    init(repo: UserRepository = UserRepositoryImpl()){
        self.repo = repo
    }
    
    func checkLogin(phoneNumber: String, password: String) {
        repo.checkUserLogin(phoneNumber: phoneNumber, password: password) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success( let user):
                if user.isSuccess ?? false {
                    self.presenter?.customerHaveAccount(user)
                } else {
                    self.presenter?.customerDidnotHaveAccount(error: ResponseError.invalidInput)
                }
            case .failure(let error):
                self.presenter?.customerDidnotHaveAccount(error: error)
            }
        }
    }
    
    func saveToken(userToken: UserToken) {
        repo.saveToken(userToken: userToken)
    }
   
}
