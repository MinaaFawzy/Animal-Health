//
//  CustomerRepository.swift
//  Animal Health
//
//  Created by OSX on 31/08/2022.
//

import Foundation

protocol UserRepository {

    func checkUserLogin(
        phoneNumber: String,
        password: String,
        completion: @escaping (Result<UserToken,Error>) -> Void
    )

    func addNewCustomer(
        name: String,
        phoneNumber: String,
        password: String,
        compilation: @escaping (Result<UserRegister, Error>) -> Void
    )

    func saveToken(userToken: UserToken)
}
