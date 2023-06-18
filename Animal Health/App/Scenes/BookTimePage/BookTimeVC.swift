//
//  BookTimeVC.swift
//  Animal Health App
//
//  Created by OSX on 05/09/2022.
//  
//

import UIKit

class BookTimeVC: UIViewController, BookTimeViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource{
    
    

    //MARK: - Variables
    var presenter: BookTimePresenterProtocol!
    var timeSlotId: Int = 0
    //MARK: - @IBOUTLETS
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorView: UIView!
    @IBOutlet weak var timeCollection: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var loadingButton: LoadingButton!
    
    //MARK: - Screen Life
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setViewLayout()
        collectionSetup()
        collectionLayout(timeCollection)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - @IBACTIONS
    @IBAction func nextButtonPressed(_ sender: Any) {
        loadingButton.showLoading()
        loadingButton.isHidden = false
        presenter.nextButtonWasPressed(timeSlotId: timeSlotId)
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter.backButtonWasPressed()
    }
    
    //MARK: - Collection Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.timeSlot.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as TimeCell
        cell.layer.cornerRadius = 20
        cell.availableTimeLabel.text = presenter.timeSlot[indexPath.row].startAt?.availabeTimeSlot()
        return cell
     
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TimeCell
        cell.availableTimeView.backgroundColor = .lightGray
        cell.availableTimeLabel.textColor = .white
        timeSlotId = presenter.timeSlot[indexPath.row].slotId ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TimeCell
        cell.availableTimeView.backgroundColor = .white
        cell.availableTimeLabel.textColor = UIColor.init(named: "grayBorder")
    }
   
    //MARK: - Extension Functions
    func setViewLayout() {
        doctorView.viewLayout()
        backgroundView.setupBackgroundGradient(nil)
        nextButton.layer.cornerRadius = 30
        timeCollection.backgroundColor = UIColor.init(displayP3Red: 91.0, green: 216.0, blue: 216.0, alpha: 0.18)
        doctorName.text = presenter.doctorInfo.userName
        let url: URL = URL(string: presenter.doctorInfo.image ?? "") ?? URL(string: "https://demofree.sirv.com/nope-not-here.jpg?w=150")!
        let data = try? Data(contentsOf: url)
        doctorImage.image = UIImage(data: data!)
        loadingButton.showLoading()
        loadingButton.layer.cornerRadius = 20
    }
    
    func collectionSetup() {
        timeCollection.delegate = self
        timeCollection.dataSource = self
        timeCollection.registerNib(cell: TimeCell.self)
        
    }
    func collectionLayout(_ collection: UICollectionView) {
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: ((timeCollection.bounds.width - 40)/3), height: 50.0)
        layout.minimumInteritemSpacing = 10.0
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        collection.setCollectionViewLayout(layout, animated: true)
    }
    
    func reloadData() {
        timeCollection.reloadData()
    }
    
    func stopLoadingData() {
        loadingButton.isHidden = true
        loadingButton.hideLoading()
    }
    func errorMassage(_ errorMassage: String) {
        let alert = UIAlertController(title: "", message: errorMassage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert, animated: true)
   
    }
   
    
}


