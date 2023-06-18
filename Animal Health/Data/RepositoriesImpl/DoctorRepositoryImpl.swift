//
//  DoctorRepositoryImpl.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//

import Foundation
import Moya

class DoctorRepositoryImpl: DoctorRepository {
    
    let DoctorProvider = MoyaProvider<DoctorSearch>()
    
    func getDoctorList(
        pageNum: Int,
        keyword: String,
        completion: @escaping (Result<DoctorModel, Error>) -> Void
    ) {
        DoctorProvider.request(.getDoctor(counter: pageNum, Text: keyword)) { result in
            Decoder.decode(completion: completion, result: result)
        }
        
    }
    
    
}
