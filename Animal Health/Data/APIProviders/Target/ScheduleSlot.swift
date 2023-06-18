//
//  ScheduleSlot.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//

import Foundation
import Moya

enum ScheduleSlot {
    case GetAllAvailableDays(doctotId: String)
    case getAllSlot(doctorId: String, day: String)
}

extension ScheduleSlot: TargetType {
    var baseURL: URL {
        URL(string: "http://andrew100-001-site1.etempurl.com/api/ScheduleSlot")!
    }
    
    var path: String {
        switch self {
        case .getAllSlot:
            return "GetAllSlots"
        case .GetAllAvailableDays:
            return "GetallDays"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllSlot:
            return .get
        case .GetAllAvailableDays:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .getAllSlot(doctorId, day):
            return .requestParameters(parameters: [
                "doctorId" : doctorId,
                "day" : day], encoding: URLEncoding.queryString )
        case let .GetAllAvailableDays(doctotId):
            return .requestParameters(parameters: ["doctorId" : doctotId], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
    

}
