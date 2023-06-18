//
//  RefreshTokenRepositoryImpl.swift
//  Animal Health
//
//  Created by OSX on 13/09/2022.
//

import Foundation
import Moya

class RefreshTokenRepositoryImpl: RefreshTokenRepository {
    
    let refreshProvider = MoyaProvider<RefreshToken>(plugins:[
        NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))
    ])
   
    let token = UserDefaults.standard.value(forKey: "token") ?? ""

    func refreshToken(completion: @escaping (Result<UserRefreshToken, Error>) -> Void) {
        refreshProvider.request(.refreshToken(Token: token as! String)) { result in
            Decoder.decode(completion: completion, result: result)
        }
    }
}
