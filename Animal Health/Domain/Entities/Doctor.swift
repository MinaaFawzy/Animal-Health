//
//  Doctor.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//

import Foundation

// MARK: - Doctor Model
struct DoctorModel: Codable {
    let doctors: [Doctor]?
    let pageNumber: Int?
    let maxPage: Int?
}

// MARK: - Doctor
struct Doctor: Codable {
    let doctorId: String?
    let image: String?
    let userName: String?
    let fees: Int?
    let specialization: String?
    let nearstSlot: NearstSlot?
}

// MARK: - NearstSlot
struct NearstSlot: Codable {
    let doctorID: String?
    let dayWeek: Int?
    let dayWeekText: String?
    let slotID: Int?
    let startAt, endAt: String?
    let isReserverd: Bool?

    
}

