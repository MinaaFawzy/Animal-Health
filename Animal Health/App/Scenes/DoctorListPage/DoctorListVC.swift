//
//  DoctorListVC.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import UIKit

class DoctorListVC: UIViewController, DoctorListViewProtocol  , UITableViewDelegate , UITableViewDataSource{
    
   
    var presenter: DoctorListPresenterProtocol!
    

    //MARK: - @IBOUTLETS
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var doctorsTable: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var loadingButton: LoadingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(PageNum: presenter.pageNum)
        reloadView()
        setLayout()
        tableSetup()
    }
    
    //MARK: - @IBACTIONS
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter.backButtonWasPressed()
    }
    @IBAction func searchButtonPressed(_ sender: Any) {
        presenter.doctorList = []
        presenter.pageNum = 1
        loadingButton.isHidden = false
        loadingButton.showLoading()
        presenter.searchButtonWasPressed(keyword: searchTF.text!)
    }
    
    //MARK: - TABLE EXTENSIONS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.doctorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == presenter.doctorList.count{
            presenter.viewDidLoad(PageNum: (presenter.pageNum + 1))
        }
        let cell = tableView.dequeue() as DoctorCellVC
        cell.setDataAtCell(item: presenter.doctorList[indexPath.row], onBookingButtonPressed: {
            self.presenter.BookingButtonWasPressed(doctorInfo: self.presenter.doctorList[indexPath.row])
        })
        return cell
    }
    
    //MARK: - Extension Functions
    func reloadView() {
        doctorsTable.reloadData()
    }
  
    func tableSetup() {
        doctorsTable.registerNib(cell: DoctorCellVC.self)
        doctorsTable.delegate = self
        doctorsTable.dataSource = self
  
    }
    func setLayout() {
        searchButton.layer.cornerRadius = 10
        searchButton.layer.cornerRadius = 10
        loadingButton.layer.cornerRadius =  20
        loadingButton.showLoading()
        navigationController?.navigationBar.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
   
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func stopLoadingData() {
        loadingButton.isHidden = true
        loadingButton.hideLoading()
    }
    func makeAlert(_ alertMassage: String) {
        let alert = UIAlertController(title: "", message: alertMassage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    
}

