//
//  CatalogService.swift
//  Animal Health
//
//  Created by OSX on 31/08/2022.
//

import Foundation
import Moya

enum Customer {
    case login(phoneNumber: String, password: String)
    case register(userName: String, phoneNumber: String, password: String)
}

extension Customer : TargetType {
    
    var baseURL: URL {
        URL(string: "http://andrew100-001-site1.etempurl.com/api/Customer")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "Login"
        case .register:
            return "Register"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .register:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .login(phoneNumber, password):
            return .requestParameters(parameters: ["PhoneNumber": phoneNumber, "Password": password], encoding: JSONEncoding.default)
        case let .register(userName, phoneNumber, password):
            return .requestParameters(parameters: [
                "UserName": userName,
               "PhoneNumber": phoneNumber,
               "Password": password],encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
    
    
}
