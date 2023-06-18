//
//  RegisterProtocolswift.swift
//  Animal Health App
//
//  Created by MoOoN on 30/08/2022.
//  
//

import Foundation

protocol RegisterViewProtocol: AnyObject {
    var presenter: RegisterPresenterProtocol! { get set }
    func makeAlert(_ ErrorMassage: String)
    func loadingData(buttonFlage: Bool)
}

protocol RegisterPresenterProtocol: AnyObject {
    var view: RegisterViewProtocol? { get set }
    func backButtonWasPressed()
    func signInButtonPressed(
        name: String,
        phoneNumber: String,
        password: String,
        confirmPassword: String
    ) -> Bool
}

protocol RegisterRouterProtocol {
    func goBack()
    func goToVerifyMobileNum(phoneNumber: String)
    
}

protocol RegisterInteractorInputProtocol {
    var presenter: RegisterInteractorOutputProtocol? { get set }
    func checkRegistration(
        userName: String,
        phoneNumber: String,
        password: String,
        confirmPassword: String
    )
}

protocol RegisterInteractorOutputProtocol: AnyObject {
        
    func accountAreCreateSuccessfully(phoneNumber: String)
    func accountDidnotCreate(error : Error)
    
}
