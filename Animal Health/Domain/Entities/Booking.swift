//
//  Booking.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//

import Foundation

struct PreviousBooking: Codable {
    let appointmentDetails: [Booking]
    let pageNumber: Int
    let maxPage: Int
}

struct Booking: Codable {
    let isFollowUp: Bool?
    let isCancelled: Bool?
    let price: Int?
    let appointmentID: Int?
    let slotID: Int?
    let date: String?
    let doctor: Doctor?
 
}

struct DoctorInfo: Codable {
    let doctorID: String?
    let image: String?
    let userName: String?
    let fees: Int?

    
}

struct AppointmentModel: Codable {
    let isSuccess: Bool?
    let message: String?
}

