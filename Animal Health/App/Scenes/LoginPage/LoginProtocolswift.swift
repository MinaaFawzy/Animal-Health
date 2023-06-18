//
//  LoginProtocolswift.swift
//  Animal Health App
//
//  Created by MoOoN on 30/08/2022.
//  
//

import Foundation

protocol LoginViewProtocol: AnyObject {
    var presenter: LoginPresenterProtocol! { get set }
    func makeAlert(_ alertMassge: String)
    func loadingData(buttonFlage: Bool)
}

protocol LoginPresenterProtocol: AnyObject {
    var view: LoginViewProtocol? { get set }
    func createAccountButtonWasPressed()
    func loginButtonWasPressed(phoneNumber: String, pass: String) -> Bool
    func skipButtonPressed()
}

protocol LoginRouterProtocol {
    func goToCreateAccountScreen()
    func goToHomeScreen()
}

protocol LoginInteractorInputProtocol {
    var presenter: LoginInteractorOutputProtocol? { get set }
    func checkLogin(phoneNumber: String , password: String)
    func saveToken(userToken: UserToken)
}

protocol LoginInteractorOutputProtocol: AnyObject {
    func customerHaveAccount(_ userToken: UserToken)
    func customerDidnotHaveAccount(error: Error)
}
