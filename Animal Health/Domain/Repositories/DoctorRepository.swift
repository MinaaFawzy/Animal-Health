//
//  DoctorRepository.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//

import Foundation

protocol DoctorRepository {
    
    func getDoctorList(
        pageNum: Int,
        keyword: String,
        completion: @escaping (Result<DoctorModel,Error>) -> Void
    )
}
