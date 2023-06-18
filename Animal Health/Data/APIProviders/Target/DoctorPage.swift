//
//  DoctorPage.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//

import Foundation
import Moya

enum DoctorSearch {
    case getDoctor(counter: Int, Text: String)
}

extension DoctorSearch: TargetType {
    var baseURL: URL {
        URL(string: "http://andrew100-001-site1.etempurl.com/api/Doctor")!
    }
    
    var path: String {
        switch self {
        case .getDoctor:
            return "SearchDoctor"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getDoctor:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .getDoctor(counter, Text):
            return .requestParameters(parameters: [
                "counter" : counter,
                "Text" : Text], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
    

}
