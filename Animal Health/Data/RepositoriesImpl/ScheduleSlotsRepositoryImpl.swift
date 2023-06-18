//
//  ScheduleSlotsRepositoryImpl.swift
//  Animal Health App
//
//  Created by OSX on 12/09/2022.
//

import Foundation
import Moya

class ScheduleSlotsRepositoryImpl: ScheduleSlotsRepository {
    
    let schedulePrbvider = MoyaProvider<ScheduleSlot>()
    
    func getAllAvailableDays(doctorId: String, completion: @escaping (Result<[String], Error>) -> Void) {
        schedulePrbvider.request(.GetAllAvailableDays(doctotId: doctorId)) { result in
            Decoder.decode(completion: completion, result: result)
        }
    }
    
    func getavailableTime(doctorId: String, day: String, completion: @escaping (Result<[TimeSlot], Error>) -> Void) {
        schedulePrbvider.request(.getAllSlot(doctorId: doctorId, day: day )) { result in
            Decoder.decode(completion: completion, result: result)
        }
    }
    
 
}
