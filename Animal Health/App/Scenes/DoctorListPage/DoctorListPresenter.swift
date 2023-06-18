//
//  DoctorListPresenter.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import Foundation

class DoctorListPresenter: DoctorListPresenterProtocol, DoctorListInteractorOutputProtocol {
    
    weak var view: DoctorListViewProtocol?
    private let interactor: DoctorListInteractorInputProtocol
    private let router: DoctorListRouterProtocol
    var doctorList: [Doctor] = []
    var pageNum: Int = 1
    var totalPage: Int = 0
    
    init(view: DoctorListViewProtocol,interactor: DoctorListInteractorInputProtocol, router: DoctorListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Presenter
    func backButtonWasPressed() {
        router.goBack()
    }
    
    func searchButtonWasPressed(keyword: String) {
        interactor.getDoctorList(pageNum: pageNum, keyword: keyword)
    }
    
    func BookingButtonWasPressed(doctorInfo: Doctor) {
        if UserDefaults.standard.value(forKey: "token") != nil {
            router.goToBookingPage(doctorInfo: doctorInfo)
        } else {
            router.goToLoginPage()
        }
    }
    
    //MARK: - InterActor
    func viewDidLoad(PageNum: Int) {
        interactor.getDoctorList(pageNum: PageNum,keyword: "")
    }
    
    func getDoctorListSuccessfully(doctorModel: DoctorModel) {
        doctorList += doctorModel.doctors!
        if doctorList.count == 0 {
            view?.makeAlert("Search Didnot Found any Thing")
        }
        pageNum = doctorModel.pageNumber!
        totalPage = doctorModel.maxPage!
        view?.stopLoadingData()
        view?.reloadView()
    }
    
    func didnotgetDoctorList(error: Error) {
        view?.stopLoadingData()
        router.goToErrorPage()
    }
    
}
