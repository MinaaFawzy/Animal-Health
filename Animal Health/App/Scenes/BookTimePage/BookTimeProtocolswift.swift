//
//  BookTimeProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 05/09/2022.
//  
//

import Foundation

//MARK: - Viwe
protocol BookTimeViewProtocol: AnyObject {
    var presenter: BookTimePresenterProtocol! { get set }
    func reloadData()
    func stopLoadingData()
    func errorMassage(_ errorMassage: String)
}

//MARK: - Presenter
protocol BookTimePresenterProtocol: AnyObject {
    var view: BookTimeViewProtocol? { get set }
    var doctorInfo: Doctor { get set }
    var date: String { get }
    var timeSlot: [TimeSlot] { get set }
    func backButtonWasPressed()
    func nextButtonWasPressed(timeSlotId : Int)
    func viewDidLoad()
    
}

//MARK: -Router
protocol BookTimeRouterProtocol {
    func backToBookAppointment()
    func GoToTabBar()
    func goToErrorPage() 

    
}
//MARK: - Interactor
protocol BookTimeInteractorInputProtocol {
    var presenter: BookTimeInteractorOutputProtocol? { get set }
    func getScheduleTime(doctorId: String, day: String)
    func addAppointment(doctorId: String, slotId: Int)
}

protocol BookTimeInteractorOutputProtocol: AnyObject {
    
    func getScheduleTimeSuccessfully(item: [TimeSlot])
    func didnotGetScheduleTime(error: Error)
    
    func appointmentDoneSuccessfully(item: AppointmentModel)
    func failedToAppointment(error: Error)
}
