//
//  BookAppoinmentVC.swift
//  Animal Health App
//
//  Created by Mina Fawzy on 05/09/2022.
//  
//

import UIKit
import FSCalendar

class BookAppoinmentVC: UIViewController, BookAppoinmentViewProtocol, FSCalendarDataSource, FSCalendarDelegate {
    
    //MARK: - Variables
    var presenter: BookAppoinmentPresenterProtocol!
    var myDate: String = ""
    
    var formatter = DateFormatter()
    //MARK: - IBOUTLETS
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var loadingButton: LoadingButton!
    
    //MARK: - Screen life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewLayout()
        setupCalendar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidload()
    }
    //MARK: - Calendar Function
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        myDate = ""
        for item in presenter.allDays{
            let temp = item.split(separator: "T")
            if temp[0] == self.formatter.string(from: date) {
                myDate = self.formatter.string(from: date)
                break
            }
        }
        if myDate == "" {
            let alert = UIAlertController(title: "", message: "No available Slots in this day", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            present(alert, animated: true)
        }
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        var date : Date?
        if presenter.allDays.count != 0{
            let myDate = presenter.allDays[0].split(separator: "T")
             date = formatter.date(from: String(myDate[0] ))
        }
        return date ?? Date()
    }
    func maximumDate(for calendar: FSCalendar) -> Date {
        var date : Date?
        if presenter.allDays.count != 0 {
            let myDate = presenter.allDays[presenter.allDays.count - 1].split(separator: "T")
            date = formatter.date(from: String(myDate[0] ))
        }
        return date ?? Date()
    }
    
    //MARK: - @IBACTIONS
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter.backButtonWasPressed()
    }
    @IBAction func goNextButtonPressed(_ sender: Any) {
        presenter.NextButtonWasPressed(date: myDate, doctorInfo: presenter.doctorInfo)
    }
  
    //MARK: - Extension Functions
    func setViewLayout() {
        formatter.dateFormat = "yyyy-MM-dd"
        calendar.viewLayout()
        doctorView.viewLayout()
        backgroundView.setupBackgroundGradient(nil)
        nextButton.layer.cornerRadius = 30
        doctorName.text = presenter.doctorInfo.userName
        let url: URL = URL(string: presenter.doctorInfo.image ?? "") ?? URL(string: "https://demofree.sirv.com/nope-not-here.jpg?w=150")!
        let data = try? Data(contentsOf: url)
        doctorImage.image = UIImage(data: data!)
        loadingButton.showLoading()
        loadingButton.layer.cornerRadius = 20
    }
    func setupCalendar() {
        calendar.dataSource = self
        calendar.delegate = self
        calendar.appearance.todayColor = .blue
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.weekdayTextColor = .black
  
    }
    func reloadCalendar() {
        calendar.reloadData()
    }
    func stopLoadingData() {
        loadingButton.hideLoading()
        loadingButton.isHidden = true
    }
}

