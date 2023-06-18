//
//  BookingProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import Foundation

//MARK: - View
protocol BookingViewProtocol: AnyObject {
    var presenter: BookingPresenterProtocol! { get set }
    func stopLoadingData()
    func reloadData()
}

//MARK: - Presenter
protocol BookingPresenterProtocol: AnyObject {
    var view: BookingViewProtocol? { get set }
    var startingSoonList: [Booking]  { get set }
    var upcommingBooingList: [Booking]  { get set }
    var bookingData: [Booking] { get }
    func joinCallButtonWasPressed()
    func previousButtonWasPressed()
    func viewDidLoad()
}

//MARK: - Router
protocol BookingRouterProtocol {
    func goToTeleconsultation()
    func goToPreviousBookingPage()
    func goToErrorPage()
    func goToLoginPage()
}

//MARK: - Interactor
protocol BookingInteractorInputProtocol {
    var presenter: BookingInteractorOutputProtocol? { get set }
    func getBookingData()
    
}

protocol BookingInteractorOutputProtocol: AnyObject {
    
    func getBookingDataSuccessfully(item: [Booking])
    func didnotGetBookingData(error: Error)
}
