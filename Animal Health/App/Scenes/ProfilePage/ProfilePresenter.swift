//
//  ProfilePresenter.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import Foundation

class ProfilePresenter: ProfilePresenterProtocol, ProfileInteractorOutputProtocol {
    
    
    weak var view: ProfileViewProtocol?
    private let interactor: ProfileInteractorInputProtocol
    private let router: ProfileRouterProtocol

    
    init(view: ProfileViewProtocol, interactor: ProfileInteractorInputProtocol, router: ProfileRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func logoutButtonWasPressed() {
        router.goToLoginButton()
    }
    
}
