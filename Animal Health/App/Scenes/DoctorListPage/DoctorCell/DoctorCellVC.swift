//
//  DoctorCellVC.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import UIKit

class DoctorCellVC: UITableViewCell {
    
    private var onBookingButtonPressed: (() -> Void)?
    
    //MARK: - @IBOUTLETS
    @IBOutlet weak var CellView: UIView!
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var specializationlabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var BookingButton: UIButton!
    @IBOutlet weak var AvailableFromLabel: UILabel!
    
    //MARK: - Screen Life
    override func awakeFromNib() {
        super.awakeFromNib()
        
        BookingButton.layer.borderWidth = 1
        BookingButton.layer.borderColor = UIColor.init(named: "grayBorder")?.cgColor
        BookingButton.layer.cornerRadius = 20
        CellView.viewLayout()
    }

    //MARK: - @IBACTIONS
    @IBAction func BookingButtonPressed(_ sender: Any) {
        onBookingButtonPressed?()
    }
    
    //MARK: - EXTENSION FUNCTIONS
    func setDataAtCell(item: Doctor, onBookingButtonPressed: @escaping (() -> Void)){
        self.onBookingButtonPressed = onBookingButtonPressed
        let url: URL = URL(string: item.image ?? "") ?? URL(string: "https://demofree.sirv.com/nope-not-here.jpg?w=150")!
        let data = try? Data(contentsOf: url)
        doctorImage.image = UIImage(data: data!)
        doctorNameLabel.text = item.userName
        PriceLabel.text = "LE\(item.fees!)"
        let availableDate = item.nearstSlot?.startAt?.setDoctorAvailableDate()
        AvailableFromLabel.text = availableDate
        specializationlabel.text = item.specialization
    }
    
}

