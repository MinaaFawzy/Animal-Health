//
//  LoginPresenter.swift
//  Animal Health App
//
//  Created by MoOoN on 30/08/2022.
//  
//

import Foundation

class LoginPresenter: LoginPresenterProtocol, LoginInteractorOutputProtocol {
    
    //MARK: - Stored Properties
    weak var view: LoginViewProtocol?
    private let interactor: LoginInteractorInputProtocol
    private let router: LoginRouterProtocol
    
    //MARK: - Init
    init(view: LoginViewProtocol, interactor: LoginInteractorInputProtocol, router: LoginRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - methods
    func createAccountButtonWasPressed() {
        router.goToCreateAccountScreen()
    }
    
    func loginButtonWasPressed(phoneNumber: String, pass password: String) -> Bool {
        var flag = false
        if phoneNumber == "" {
            view?.makeAlert("Enter Your mobile number")
        } else if password == "" {
            view?.makeAlert("Enter Your Password")
        } else {
            if phoneNumber.hasPrefix("0") && phoneNumber.count == 11 && password.isValidPassword(){
                interactor.checkLogin(phoneNumber: phoneNumber, password: password)
                flag = true
            } else {
                view?.makeAlert("Incorrect Mobile Number Or Password")
            }
        }
       return flag
    }
    
    func skipButtonPressed() {
        router.goToHomeScreen()
    }
    
}

//MARK: - Interactor Output
extension LoginPresenter {
    
    func customerHaveAccount(_ userToken: UserToken) {
        interactor.saveToken(userToken: userToken)
        router.goToHomeScreen()
        view?.loadingData(buttonFlage: false)
    }
    
    func customerDidnotHaveAccount(error: Error) {
        view?.makeAlert("Incorrect Mobile Number Or Password")
        view?.loadingData(buttonFlage: false)
    }
    
}
