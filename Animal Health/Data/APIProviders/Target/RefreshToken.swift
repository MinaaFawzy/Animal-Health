//
//  RefreshToken.swift
//  Animal Health
//
//  Created by OSX on 13/09/2022.
//

import Foundation
import Moya

enum RefreshToken {
    case refreshToken(Token: String)
}

extension RefreshToken : TargetType{
    
    var baseURL: URL {
        URL(string: "http://andrew100-001-site1.etempurl.com/api/RefreshToken")!
    }
    
    var path: String {
        switch self {
        case .refreshToken:
            return "rToken"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .refreshToken:
            return .get
            
        }
    }
    
    var task: Task {
        switch self {
        case let .refreshToken(Token):
            return .requestParameters(parameters: ["sToken" : Token], encoding: URLEncoding.queryString)
            
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
    
    
}
