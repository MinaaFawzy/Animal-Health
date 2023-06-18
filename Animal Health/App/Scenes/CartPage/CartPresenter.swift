//
//  CartPresenter.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import Foundation

class CartPresenter: CartPresenterProtocol, CartInteractorOutputProtocol {
    
    weak var view: CartViewProtocol?
    private let interactor: CartInteractorInputProtocol
    private let router: CartRouterProtocol

    
    init(view: CartViewProtocol, interactor: CartInteractorInputProtocol, router: CartRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

}
