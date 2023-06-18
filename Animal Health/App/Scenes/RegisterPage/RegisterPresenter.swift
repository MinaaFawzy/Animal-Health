//
//  RegisterPresenter.swift
//  Animal Health App
//
//  Created by MoOoN on 30/08/2022.
//  
//

import Foundation

class RegisterPresenter: RegisterPresenterProtocol, RegisterInteractorOutputProtocol {
    
    weak var view: RegisterViewProtocol?
    private let interactor: RegisterInteractorInputProtocol
    private let router: RegisterRouterProtocol

    init(view: RegisterViewProtocol, interactor: RegisterInteractorInputProtocol, router: RegisterRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func backButtonWasPressed() {
        router.goBack()
    }
    
    func signInButtonPressed(
        name: String,
        phoneNumber: String,
        password: String,
        confirmPassword: String
    ) -> Bool {
        var flag = false
        if  name == "" {
            view?.makeAlert("Enter Your Name")
        } else if phoneNumber == "" {
            view?.makeAlert("Enter Your Mobile Number")
        } else if password == "" {
            view?.makeAlert("Enter Your Password")
        } else if !phoneNumber.hasPrefix("0") || phoneNumber.count != 11{
            view?.makeAlert("Invalid Mobile Number")
        } else if  !password.isValidPassword() {
            view?.makeAlert("Password must contain least one uppercase and at least one lowercase and ar least one digit")
        } else if confirmPassword != password {
            view?.makeAlert("Confirm Password dosen't match Password")
        } else {
            interactor.checkRegistration(userName: name, phoneNumber: phoneNumber, password: password, confirmPassword: confirmPassword)
             flag = true
        }
        return flag
    }
    
    func accountAreCreateSuccessfully(phoneNumber: String) {
        router.goToVerifyMobileNum(phoneNumber: phoneNumber)
        view?.loadingData(buttonFlage: false)
    }
    
    func accountDidnotCreate(error: Error) {
        view?.makeAlert(error.localizedDescription)
        view?.loadingData(buttonFlage: false)
    }

}
