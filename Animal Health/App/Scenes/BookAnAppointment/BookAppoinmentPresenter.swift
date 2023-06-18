//
//  BookAppoinmentPresenter.swift
//  Animal Health App
//
//  Created by OSX on 05/09/2022.
//  
//

import Foundation

class BookAppoinmentPresenter: BookAppoinmentPresenterProtocol, BookAppoinmentInteractorOutputProtocol {
    
    
    weak var view: BookAppoinmentViewProtocol?
    private let interactor: BookAppoinmentInteractorInputProtocol
    private let router: BookAppoinmentRouterProtocol
    var  doctorInfo: Doctor
    var allDays: [String] = []
    init(view: BookAppoinmentViewProtocol, interactor: BookAppoinmentInteractorInputProtocol, router: BookAppoinmentRouterProtocol, doctorInfo : Doctor) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.doctorInfo = doctorInfo
    }
    
    func backButtonWasPressed() {
        router.goBackToHome()
    }
    
    func NextButtonWasPressed(date: String, doctorInfo: Doctor) {
        router.goToSelectTime(date: date, doctorInfo: doctorInfo)
    }
    func getAllDaysSuccessfully(item: [String]) {
        allDays = item
        view?.stopLoadingData()
        view?.reloadCalendar()
    }
    
    func didnotGetAllDays(error: Error) {
        view?.stopLoadingData()
        router.goToErrorPage()
        print(error)
    }
    
    func viewDidload() {
        interactor.getAllDays(doctorId: doctorInfo.doctorId ?? "")
    }
    
    
}
