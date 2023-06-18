//
//  CustomerRepositoryImpl.swift
//  Animal Health
//
//  Created by OSX on 31/08/2022.
//

import Foundation
import Moya

class UserRepositoryImpl : UserRepository{

    let catalogProvider = MoyaProvider<Customer>()
    
    func checkUserLogin(
        phoneNumber: String,
        password: String,
        completion: @escaping (Result<UserToken, Error>) -> Void
    ) {
        catalogProvider.request(.login(phoneNumber: phoneNumber, password: password)) { result in
        Decoder.decode(completion: completion, result: result)
        }
    }

    func addNewCustomer(
        name: String,
        phoneNumber: String,
        password: String,
        compilation: @escaping (Result<UserRegister, Error>) -> Void
    ) {
        catalogProvider.request(.register(
            userName: name,
            phoneNumber: phoneNumber,
            password: password
        )) { result in
            Decoder.decode(completion: compilation, result: result)
        }
    }
    func saveToken(userToken: UserToken) {
        UserDefaults.standard.setValue(userToken.token, forKey: "token")
    }
    
   
}
