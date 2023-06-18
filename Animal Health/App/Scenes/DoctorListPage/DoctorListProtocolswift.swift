//
//  DoctorListProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import Foundation

//MARK: - View
protocol DoctorListViewProtocol: AnyObject {
    var presenter: DoctorListPresenterProtocol! { get set }
    func stopLoadingData()
    func reloadView()
    func makeAlert(_ alertMassage: String)
}

//MARK: - Presenter
protocol DoctorListPresenterProtocol: AnyObject {
    var view: DoctorListViewProtocol? { get set }
    var doctorList: [Doctor] { get set}
    var pageNum: Int { get set }
    var totalPage: Int { get }
    func backButtonWasPressed()
    func searchButtonWasPressed(keyword: String)
    func BookingButtonWasPressed(doctorInfo: Doctor)
    func viewDidLoad(PageNum: Int)
    
}

//MARK: - Router
protocol DoctorListRouterProtocol {
    func goBack()
    func goToErrorPage()
    func goToBookingPage(doctorInfo: Doctor)
    func goToLoginPage()
}

//MARK: - Interactor
protocol DoctorListInteractorInputProtocol {
    var presenter: DoctorListInteractorOutputProtocol? { get set }

    func getDoctorList(pageNum: Int, keyword: String)
}

protocol DoctorListInteractorOutputProtocol: AnyObject {
    
    func getDoctorListSuccessfully(doctorModel: DoctorModel)
    func didnotgetDoctorList(error: Error)
  
}
