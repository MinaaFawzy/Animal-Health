//
//  BookingRepositoryImpl.swift
//  Animal Health App
//
//  Created by OSX on 11/09/2022.
//

import Foundation
import Moya

class BookingRepositoryImpl: BookingRepository {
    
    let BookingProvider:  MoyaProvider<Appointment> = {
        let session: Moya.Session = .init(interceptor: CustomInterseptor())
        return MoyaProvider<Appointment>(session: session, plugins: [
            AccessTokenPlugin { _ in 
                return (UserDefaults.standard.value(forKey: "token") as? String) ?? ""
            },
            NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))
        ]
    )
        
    }()
    
    func getBookingData(completion: @escaping (Result<[Booking], Error>) -> Void) {
        BookingProvider.request(.UcomingBooking) { result in
            Decoder.decode(completion: completion, result: result)
        }
    }
    func getPerviousBookingData(counter: Int, completion: @escaping (Result<PreviousBooking, Error>) -> Void) {
        BookingProvider.request(.bookingHistory(counter: counter)) { result in
            Decoder.decode(completion: completion, result: result)
        }
    }
    
    func addAppoientment(doctorId: String, SlotId: Int, completion: @escaping (Result<AppointmentModel, Error>) -> Void) {
        BookingProvider.request(.addAppointment(doctorId: doctorId, SlotId: SlotId)) { result in
            Decoder.decode(completion: completion, result: result)
        }
    }
    
    
}
