//
//  TabBarPresenter.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import Foundation

class TabBarPresenter: TabBarPresenterProtocol, TabBarInteractorOutputProtocol {
    
    weak var view: TabBarViewProtocol?
    private let interactor: TabBarInteractorInputProtocol
    private let router: TabBarRouterProtocol

    
    init(view: TabBarViewProtocol, interactor: TabBarInteractorInputProtocol, router: TabBarRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

}
