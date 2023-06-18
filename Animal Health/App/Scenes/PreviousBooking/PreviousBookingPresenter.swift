//
//  PreviousBookingPresenter.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//  
//

import Foundation

class PreviousBookingPresenter: PreviousBookingPresenterProtocol, PreviousBookingInteractorOutputProtocol {
    
    
    
    weak var view: PreviousBookingViewProtocol?
    private let interactor: PreviousBookingInteractorInputProtocol
    private let router: PreviousBookingRouterProtocol
    private(set) var PreviousBooking: [Booking] = []
    var currentPage: Int = 1
    var totalPages: Int = 0
    
    
    init(view: PreviousBookingViewProtocol, interactor: PreviousBookingInteractorInputProtocol, router: PreviousBookingRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func backButtonWasPressed() {
        router.goBackToMyBooking()
    }
    
    func getPreviousDataSuccessfully(item: PreviousBooking) {
        PreviousBooking += item.appointmentDetails
        currentPage = item.pageNumber
        totalPages = item.maxPage
        view?.stopLoadingData()
        view?.reloadData()
    }
    
    func didnotGetPreviousData(error: Error) {
        view?.stopLoadingData()
        print(error)
        router.goToErrorPage()
    }
    
    func viewDidLoad(pageNum: Int) {
        interactor.getPreviousData(counter: pageNum)
    }

}
