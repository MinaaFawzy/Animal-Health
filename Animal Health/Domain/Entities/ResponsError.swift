//
//  ResponsError.swift
//  Animal Health
//
//  Created by OSX on 03/09/2022.
//

import Foundation

enum ResponseError: Error {
    case invalidInput
}

extension ResponseError: LocalizedError {
    var errorDescription: String?{
        switch self {
        case .invalidInput:
            return "invalid input"
        }
    }
    
}
