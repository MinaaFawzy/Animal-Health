//
//  ErrorPagePresenter.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//  
//

import Foundation

class ErrorPagePresenter: ErrorPagePresenterProtocol, ErrorPageInteractorOutputProtocol {
    
    weak var view: ErrorPageViewProtocol?
    private let interactor: ErrorPageInteractorInputProtocol
    private let router: ErrorPageRouterProtocol
    
    init(view: ErrorPageViewProtocol, interactor: ErrorPageInteractorInputProtocol, router: ErrorPageRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func backButtonWasPressed() {
        router.goBackToHome()
    }

}
