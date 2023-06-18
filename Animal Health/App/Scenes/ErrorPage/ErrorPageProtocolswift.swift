//
//  ErrorPageProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//  
//

import Foundation

//MARK: - View
protocol ErrorPageViewProtocol: AnyObject {
    var presenter: ErrorPagePresenterProtocol! { get set }
}

//MARK: - Presenter
protocol ErrorPagePresenterProtocol: AnyObject {
    var view: ErrorPageViewProtocol? { get set }
    func backButtonWasPressed()
}

//MARK: - Router
protocol ErrorPageRouterProtocol {
    func goBackToHome()
}

//MARK: - Interactor
protocol ErrorPageInteractorInputProtocol {
    var presenter: ErrorPageInteractorOutputProtocol? { get set }
}

protocol ErrorPageInteractorOutputProtocol: AnyObject {
    
}
