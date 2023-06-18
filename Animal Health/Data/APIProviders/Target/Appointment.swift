//
//  Appointment.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//

import Foundation
import Moya

enum Appointment {
    case bookingHistory(counter: Int)
    case addAppointment(doctorId: String, SlotId: Int)
    case UcomingBooking
}

extension Appointment: TargetType, AccessTokenAuthorizable {
    
    var baseURL: URL {
        URL(string: "http://andrew100-001-site1.etempurl.com/api/Appointment")!
    }
    
    var path: String {
        switch self{
        case .bookingHistory:
            return "BookingHistory"
        case .addAppointment:
            return "addAppointment"
        case .UcomingBooking:
            return "UpComingBooking"
        }
    }
    var method: Moya.Method {
        switch self {
        case .bookingHistory, .UcomingBooking:
            return .get
        case .addAppointment:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .bookingHistory(counter):
            return .requestParameters(parameters: ["counter" : counter ],encoding: URLEncoding.queryString)
        case let .addAppointment(doctorId,SlotId):
            return .requestParameters(parameters: [
                "doctorId" : doctorId,
                "SlotId" : SlotId ],
              encoding: JSONEncoding.default)
        case .UcomingBooking:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
}
