//
//  ShopPresenter.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import Foundation

class ShopPresenter: ShopPresenterProtocol, ShopInteractorOutputProtocol {
    
    weak var view: ShopViewProtocol?
    private let interactor: ShopInteractorInputProtocol
    private let router: ShopRouterProtocol

    
    init(view: ShopViewProtocol, interactor: ShopInteractorInputProtocol, router: ShopRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

}
