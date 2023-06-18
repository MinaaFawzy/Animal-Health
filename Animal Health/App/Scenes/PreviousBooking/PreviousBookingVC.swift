//
//  PreviousBookingVC.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//  
//

import UIKit

class PreviousBookingVC: UIViewController, PreviousBookingViewProtocol, UITableViewDelegate, UITableViewDataSource {
    

    var presenter: PreviousBookingPresenterProtocol!
   
    //MARK: - @IBOUTLETS
    @IBOutlet weak var loadingButton: LoadingButton!
    @IBOutlet weak var previousBookingTable: UITableView!
       
    //MARK: - Screen Life
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(pageNum: presenter.currentPage)
        setupTable()
        setScreenLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - @IBACTIONS
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter.backButtonWasPressed()
    }
    
    //MARK: - Table Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.PreviousBooking.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == (presenter.PreviousBooking.count - 1)) {
            if presenter.currentPage < presenter.totalPages {
                presenter.viewDidLoad(pageNum: presenter.currentPage + 1)
            }
        }
        
        let cell = tableView.dequeue() as PreviousCell
        cell.setData(item: presenter.PreviousBooking[indexPath.row])
        return cell
    }
    
    //MARK: - Extension Functions
    func setupTable() {
        previousBookingTable.delegate = self
        previousBookingTable.dataSource = self
        previousBookingTable.registerNib(cell: PreviousCell.self)
    }
    func setScreenLayout() {
        loadingButton.layer.cornerRadius = 20
        loadingButton.showLoading()
    }
    func stopLoadingData() {
        loadingButton.isHidden = true
        loadingButton.hideLoading()
    }
    func reloadData() {
        previousBookingTable.reloadData()
    }
   
    
}

