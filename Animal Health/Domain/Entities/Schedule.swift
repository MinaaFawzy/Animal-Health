//
//  Schedule.swift
//  Animal Health App
//
//  Created by OSX on 12/09/2022.
//

import Foundation

struct TimeSlot: Codable {
    
    let doctorID: String?
    let dayWeek: Int?
    let dayWeekText: String?
    let slotId: Int?
    let startAt:String?
    let endAt: String?
    let isReserverd: Bool?
}
