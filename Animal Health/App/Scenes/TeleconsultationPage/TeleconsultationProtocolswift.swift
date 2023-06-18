//
//  TeleconsultationProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 06/09/2022.
//  
//

import Foundation

//MARK: - View
protocol TeleconsultationViewProtocol: AnyObject {
    var presenter: TeleconsultationPresenterProtocol! { get set }
}
//MARK: - Presenter
protocol TeleconsultationPresenterProtocol: AnyObject {
    var view: TeleconsultationViewProtocol? { get set }
    func cancelButtonWasPressed()
}

//MARK: - Router
protocol TeleconsultationRouterProtocol {
    func goBackToMyBooking()
}

//MARK: - Interactor
protocol TeleconsultationInteractorInputProtocol {
    var presenter: TeleconsultationInteractorOutputProtocol? { get set }
}

protocol TeleconsultationInteractorOutputProtocol: AnyObject {
    
}
