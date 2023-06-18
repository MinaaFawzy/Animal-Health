//
//  BookTimeInteractor.swift
//  Animal Health App
//
//  Created by OSX on 05/09/2022.
//  
//

import Foundation

class BookTimeInteractor: BookTimeInteractorInputProtocol {
    
    weak var presenter: BookTimeInteractorOutputProtocol?
    let repo: ScheduleSlotsRepository
    let appointmentRepo : BookingRepository
    init(repo: ScheduleSlotsRepository = ScheduleSlotsRepositoryImpl(),appointmentRepo : BookingRepository = BookingRepositoryImpl()){
        self.repo = repo
        self.appointmentRepo = appointmentRepo
    }
    
    
    
    func getScheduleTime(doctorId: String, day: String) {
        repo.getavailableTime(doctorId: doctorId, day: day) {  [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.presenter?.getScheduleTimeSuccessfully(item: response)
            case .failure(let error):
                self.presenter?.didnotGetScheduleTime(error: error)
            }
        }
    }
    
    func addAppointment(doctorId: String, slotId: Int) {
        appointmentRepo.addAppoientment(doctorId: doctorId, SlotId: slotId) {  [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.presenter?.appointmentDoneSuccessfully(item: response)
            case .failure(let error):
                self.presenter?.failedToAppointment(error: error)
            }
        }
    }
  
    
}
