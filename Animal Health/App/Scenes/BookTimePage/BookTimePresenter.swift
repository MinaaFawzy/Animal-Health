//
//  BookTimePresenter.swift
//  Animal Health App
//
//  Created by OSX on 05/09/2022.
//  
//

import Foundation

class BookTimePresenter: BookTimePresenterProtocol, BookTimeInteractorOutputProtocol {
    
    
    weak var view: BookTimeViewProtocol?
    private let interactor: BookTimeInteractorInputProtocol
    private let router: BookTimeRouterProtocol
    private(set) var date: String
    var doctorInfo: Doctor
    var timeSlot: [TimeSlot] = []
    
    
    
    init(view: BookTimeViewProtocol, interactor: BookTimeInteractorInputProtocol, router: BookTimeRouterProtocol, date: String, doctorInfo: Doctor ) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.date = date
        self.doctorInfo = doctorInfo
    }
    //MARK: - Presenter
    func backButtonWasPressed() {
        router.backToBookAppointment()
    }
    
    func nextButtonWasPressed(timeSlotId : Int) {
        interactor.addAppointment(doctorId: doctorInfo.doctorId ?? "", slotId: timeSlotId)
        
    }
    
    //MARK: - Interactor
    func viewDidLoad() {
        interactor.getScheduleTime(doctorId: doctorInfo.doctorId! , day: date)
    }
    
    func getScheduleTimeSuccessfully(item: [TimeSlot]) {
        timeSlot = item
        view?.reloadData()
        view?.stopLoadingData()
    }
    
    func didnotGetScheduleTime(error: Error) {
        view?.stopLoadingData()
        router.goToErrorPage()
    }
    func appointmentDoneSuccessfully(item: AppointmentModel) {
        if item.isSuccess ?? false{
            router.GoToTabBar()
        } else {
            view?.errorMassage("Booking failed")
        }
        view?.stopLoadingData()
    }
    
    func failedToAppointment(error: Error) {
        view?.errorMassage("Booking failed")
        view?.stopLoadingData()
    }
 
    
}
