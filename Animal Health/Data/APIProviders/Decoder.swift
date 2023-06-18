//
//  ResultRequest.swift
//  Animal Health
//
//  Created by Mina Fawzy on 04/09/2022.
//

import Foundation
import Moya

class Decoder  {
    
    static func decode<T: Decodable>(completion: @escaping(Result<T, Error>) -> Void, result: Result<Response, MoyaError>) {
        switch result {
        case .success(let response):
            do {
                let data = try JSONDecoder().decode(T.self, from: response.data)
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
}

