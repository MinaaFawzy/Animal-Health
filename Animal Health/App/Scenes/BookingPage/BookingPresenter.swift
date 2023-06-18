//
//  BookingPresenter.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import Foundation

class BookingPresenter: BookingPresenterProtocol, BookingInteractorOutputProtocol {
   
    
    weak var view: BookingViewProtocol?
    private let interactor: BookingInteractorInputProtocol
    private let router: BookingRouterProtocol
    var bookingData: [Booking] = []
    var startingSoonList: [Booking] = []
    var upcommingBooingList: [Booking] = []
  
    init(view: BookingViewProtocol, interactor: BookingInteractorInputProtocol, router: BookingRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - presenter
    func joinCallButtonWasPressed() {
        router.goToTeleconsultation()
    }
   
    func previousButtonWasPressed() {
        router.goToPreviousBookingPage()
    }
    func viewDidLoad() {
        if UserDefaults.standard.value(forKey: "token") != nil {
            interactor.getBookingData()
        } else {
            router.goToLoginPage()
        }
    }
    
    
    func getBookingDataSuccessfully(item: [Booking]) {
        startingSoonList = []
        upcommingBooingList = []
        bookingData = item
        for myitem in bookingData{
            if myitem.date?.nearstBooking() == true {
                startingSoonList.append(myitem)
            } else {
                upcommingBooingList.append(myitem)
            }
        }
        view?.stopLoadingData()
        view?.reloadData()
    }
    
    func didnotGetBookingData(error: Error) {
        view?.stopLoadingData()
        router.goToErrorPage()
    }
   
}
