//
//  RefreshTokenRepository.swift
//  Animal Health
//
//  Created by OSX on 13/09/2022.
//

import Foundation

protocol RefreshTokenRepository {
    func refreshToken(completion: @escaping (Result<UserRefreshToken,Error>) -> Void)
}
