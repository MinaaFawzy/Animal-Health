//
//  ScheduleSlotsRepository.swift
//  Animal Health App
//
//  Created by OSX on 12/09/2022.
//

import Foundation

protocol ScheduleSlotsRepository {
    func getAllAvailableDays(doctorId: String, completion: @escaping (Result<[String],Error>) -> Void)
    func getavailableTime(doctorId: String, day: String, completion: @escaping (Result<[TimeSlot],Error>) -> Void)
}
