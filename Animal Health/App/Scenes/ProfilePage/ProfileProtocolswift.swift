//
//  ProfileProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import Foundation

protocol ProfileViewProtocol: AnyObject {
    var presenter: ProfilePresenterProtocol! { get set }
}

protocol ProfilePresenterProtocol: AnyObject {
    var view: ProfileViewProtocol? { get set }
    func logoutButtonWasPressed()
}

protocol ProfileRouterProtocol {
    func goToLoginButton()
}

protocol ProfileInteractorInputProtocol {
    var presenter: ProfileInteractorOutputProtocol? { get set }
}

protocol ProfileInteractorOutputProtocol: AnyObject {
    
}
