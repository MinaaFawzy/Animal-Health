//
//  BookAppoinmentProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 05/09/2022.
//  
//

import Foundation

//MARK: - View
protocol BookAppoinmentViewProtocol: AnyObject {
    var presenter: BookAppoinmentPresenterProtocol! { get set }
    func reloadCalendar()
    func stopLoadingData()
}

//MARK: - presenter
protocol BookAppoinmentPresenterProtocol: AnyObject {
    var view: BookAppoinmentViewProtocol? { get set }
    var doctorInfo: Doctor { get set }
    var allDays: [String] { get set }
    func backButtonWasPressed()
    func NextButtonWasPressed(date: String, doctorInfo: Doctor)
    func viewDidload()
}

//MARK: - Router
protocol BookAppoinmentRouterProtocol {
    func goBackToHome()
    func goToSelectTime(date: String, doctorInfo: Doctor)
    func goToErrorPage()

    
}
//MARK: - Interactor
protocol BookAppoinmentInteractorInputProtocol {
    var presenter: BookAppoinmentInteractorOutputProtocol? { get set }
    func getAllDays(doctorId: String)
}

protocol BookAppoinmentInteractorOutputProtocol: AnyObject {
    func getAllDaysSuccessfully(item: [String])
    func didnotGetAllDays(error: Error)
    
}
