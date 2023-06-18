//
//  VerifyingPresenter.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import Foundation

class VerifyingPresenter: VerifyingPresenterProtocol, VerifyingInteractorOutputProtocol {
    
    weak var view: VerifyingViewProtocol?
    private let interactor: VerifyingInteractorInputProtocol
    private let router: VerifyingRouterProtocol
    private(set) var phoneNum: String
    
    init(
        view: VerifyingViewProtocol,
        interactor: VerifyingInteractorInputProtocol,
        router: VerifyingRouterProtocol,
        phoneNum: String
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.phoneNum = phoneNum
    }
    
    func backButtonWasPressed() {
        router.goBackToCreateAccount()
    }
    
    func sendCodeWasPressed(OTPCode: String) {
        if OTPCode == "123456"{
            router.goToLoginPage()
        } else {
            view?.makeAlert("Invalid OTP")
        }
    }
    
}
