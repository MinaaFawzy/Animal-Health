//
//  User.swift
//  Animal Health
//
//  Created by OSX on 31/08/2022.
//

import Foundation

// MARK: - User Model
struct UserModel: Codable {
    
    let UserName: String?
    let PhoneNumber: String?
    let Password: String?

}

//MARK: Data Back
struct UserToken: Codable {
    let isSuccess: Bool?
    let token: String?
}

struct UserRefreshToken: Codable {
    let IsSuccess: Bool?
    let Token: String?
}


struct UserRegister: Codable {
    let isSuccess: Bool?
    let errorMassage: String?
}


