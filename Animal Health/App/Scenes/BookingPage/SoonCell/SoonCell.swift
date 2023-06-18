//
//  SoonCell.swift
//  Animal Health App
//
//  Created by OSX on 06/09/2022.
//

import UIKit

class SoonCell: UITableViewCell {

    var onJoinCallPressed: (() -> Void)?
    
    //MARK: - @IBOUTLETS
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var joinCallButton: UIButton!
    @IBOutlet weak var bookingTime: UILabel!
    @IBOutlet weak var DoctorName: UILabel!
    @IBOutlet weak var doctorImage: UIImageView!
        
    //MARK: - Screen Life
    override func awakeFromNib() {
        super.awakeFromNib()
        setScreenLayout()
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
  
    //MARK: - @IBACTIONS
    @IBAction func joinCallButtonPressed(_ sender: Any) {
        onJoinCallPressed?()
    }
    
    //MARK: - Extension Fuction
    func setScreenLayout() {
        cellView.viewLayout()
        joinCallButton.layer.borderColor = UIColor.init(named: "grayBorder")!.cgColor
        joinCallButton.layer.borderWidth = 1
        joinCallButton.layer.cornerRadius = 20
    }
    
    func setData(item: Booking,onJoinCallPressed: @escaping (() -> Void)){
        self.onJoinCallPressed = onJoinCallPressed
        bookingTime.text = item.date?.setUpcomingBookingDate()
        DoctorName.text = item.doctor?.userName
        let url: URL = URL(string: item.doctor?.image ?? "") ?? URL(string: "https://demofree.sirv.com/nope-not-here.jpg?w=150")!
        let data = try? Data(contentsOf: url)
        doctorImage.image = UIImage(data: data!)
      
    }
}
