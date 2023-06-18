//
//  VerifyingProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import Foundation

protocol VerifyingViewProtocol: AnyObject {
    var presenter: VerifyingPresenterProtocol! { get set }
    func makeAlert(_ errorMassage: String)
}

protocol VerifyingPresenterProtocol: AnyObject {
    var view: VerifyingViewProtocol? { get set }
    var phoneNum: String { get }
    func backButtonWasPressed()
    func sendCodeWasPressed(OTPCode:String)
}

protocol VerifyingRouterProtocol {
    func goBackToCreateAccount()
    func goToLoginPage()
}

protocol VerifyingInteractorInputProtocol {
    var presenter: VerifyingInteractorOutputProtocol? { get set }
}

protocol VerifyingInteractorOutputProtocol: AnyObject {
    
}
