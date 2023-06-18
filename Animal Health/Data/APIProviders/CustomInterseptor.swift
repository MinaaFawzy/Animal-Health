//
//  CustomInterseptor.swift
//  Animal Health
//
//  Created by OSX on 13/09/2022.
//

import Foundation
import Moya
import Alamofire


class CustomInterseptor: RequestInterceptor {
    
    let repo : RefreshTokenRepository
    init(repo : RefreshTokenRepository = RefreshTokenRepositoryImpl()){
        self.repo = repo
    }
    
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        let retryLimit = 3
        if request.response?.statusCode == 401 , request.retryCount <= retryLimit {
            repo.refreshToken { result in
                switch result {
                case .success(let item):
                    UserDefaults.standard.setValue(item.Token, forKey: "token")
                    completion(.retry)
                case .failure:
                    completion(.doNotRetry)
                }
            }
        } else {
            completion(.doNotRetry)
        }
    }
    
}
