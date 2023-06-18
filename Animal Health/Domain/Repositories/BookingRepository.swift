//
//  BookingRepository.swift
//  Animal Health App
//
//  Created by OSX on 11/09/2022.
//

import Foundation

protocol BookingRepository {
    func getBookingData(completion: @escaping (Result<[Booking], Error>) -> Void)
    func getPerviousBookingData(counter: Int, completion: @escaping (Result<PreviousBooking, Error>) -> Void)
    func addAppoientment(doctorId: String, SlotId: Int, completion: @escaping (Result<AppointmentModel,Error>) -> Void )
}
