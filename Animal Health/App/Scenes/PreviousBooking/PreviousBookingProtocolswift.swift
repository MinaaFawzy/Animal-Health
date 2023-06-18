//
//  PreviousBookingProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//  
//

import Foundation

//MARK: - View
protocol PreviousBookingViewProtocol: AnyObject {
    var presenter: PreviousBookingPresenterProtocol! { get set }
    func stopLoadingData() 
    func reloadData()

}

//MARK: - Presenter
protocol PreviousBookingPresenterProtocol: AnyObject {
    var view: PreviousBookingViewProtocol? { get set }
    var PreviousBooking: [Booking] { get }
    var currentPage: Int { get set }
    var totalPages: Int { get set }
    func backButtonWasPressed()
    func viewDidLoad(pageNum: Int)
}

//MARK: - Router
protocol PreviousBookingRouterProtocol {
    func goBackToMyBooking()
    func goToErrorPage() 

}

//MARK: -Interactor
protocol PreviousBookingInteractorInputProtocol {
    var presenter: PreviousBookingInteractorOutputProtocol? { get set }
    
    func getPreviousData(counter: Int)
}

protocol PreviousBookingInteractorOutputProtocol: AnyObject {
    
    func getPreviousDataSuccessfully(item: PreviousBooking)
    func didnotGetPreviousData(error: Error)
}
