//
//  TeleconsultationPresenter.swift
//  Animal Health App
//
//  Created by OSX on 06/09/2022.
//  
//

import Foundation

class TeleconsultationPresenter: TeleconsultationPresenterProtocol, TeleconsultationInteractorOutputProtocol {
    
    weak var view: TeleconsultationViewProtocol?
    private let interactor: TeleconsultationInteractorInputProtocol
    private let router: TeleconsultationRouterProtocol

    
    init(view: TeleconsultationViewProtocol, interactor: TeleconsultationInteractorInputProtocol, router: TeleconsultationRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func cancelButtonWasPressed() {
        router.goBackToMyBooking()
    }
  
}
