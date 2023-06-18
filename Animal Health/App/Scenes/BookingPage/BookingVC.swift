//
//  BookingVC.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import UIKit

class BookingVC: UIViewController, BookingViewProtocol, UITableViewDelegate, UITableViewDataSource {
    
    
    var presenter: BookingPresenterProtocol!
    
    //MARK: - @IBOUTLETS
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var bookingTable: UITableView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var loadingButton: LoadingButton!
    
    //MARK: - Screen Life
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTables()
        setScreenLayout()
    }
    override func viewDidAppear(_ animated: Bool) {
  
        super.viewDidAppear(animated)
        loadingButton.showLoading()
        loadingButton.isHidden = false
        presenter.viewDidLoad()
        }
    //MARK: - @IBACTIONS
    @IBAction func PreviousButtonPressed(_ sender: Any) {
        presenter.previousButtonWasPressed()
    }
    
    
    //MARK: - Table Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return presenter.startingSoonList.count
        case 1:
            return presenter.upcommingBooingList.count
        default :
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeue() as SoonCell
            cell.setData(item: presenter.startingSoonList[indexPath.row]) {
                self.presenter.joinCallButtonWasPressed()
            }
            return cell
        } else {
            let cell = tableView.dequeue() as UpcomingCell
            cell.setDate(item: presenter.upcommingBooingList[indexPath.row])
            return cell
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionName: String = ""
        switch section {
        case 0:
            sectionName = "Starting Soon"
        case 1:
            sectionName = "Upcoming Bookings"
        default :
            sectionName = ""
        }
        return sectionName
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
   
    //MARK: - Extension Functions
    func setupTables () {
        bookingTable.delegate = self
        bookingTable.dataSource = self
        bookingTable.registerNib(cell: SoonCell.self)
        bookingTable.registerNib(cell: UpcomingCell.self)
    }
    func setScreenLayout() {
        previousButton.layer.cornerRadius = 20
        previousButton.layer.borderColor = UIColor.white.cgColor
        previousButton.layer.borderWidth = 1
        loadingButton.layer.cornerRadius = 20
        loadingButton.showLoading()
    }
    func stopLoadingData() {
        loadingButton.isHidden = true
        loadingButton.hideLoading()
    }
    func reloadData() {
        bookingTable.reloadData()
    }
   
}

