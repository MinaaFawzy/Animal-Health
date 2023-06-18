//
//  UpcomingCell.swift
//  Animal Health App
//
//  Created by OSX on 06/09/2022.
//

import UIKit

class UpcomingCell: UITableViewCell {

    //MARK: - @IBOUTLETS
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var doctorImage: UIImageView!
   
    //MARK: - Screen Life
    override func awakeFromNib() {
        super.awakeFromNib()
        doctorImage.layer.cornerRadius = 25
        cellView.viewLayout()
    }

    //MARK: - Extension Function
    func setDate(item: Booking) {
        doctorNameLabel.text = item.doctor?.userName
        dateLabel.text = item.date?.setUpcomingBookingDate()
        let url: URL = URL(string: item.doctor?.image ?? "") ?? URL(string: "https://demofree.sirv.com/nope-not-here.jpg?w=150")!
        let data = try? Data(contentsOf: url)
        doctorImage.image = UIImage(data: data!)
      
    }
}
