//
//  PreviousCell.swift
//  Animal Health App
//
//  Created by OSX on 06/09/2022.
//

import UIKit

class PreviousCell: UITableViewCell {

    //MARK: - @IBOUTLETS
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    //MARK: - Screen Life
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.viewLayout()
        doctorImage.layer.cornerRadius = 25
        let url: URL = URL(string: "") ?? URL(string: "https://demofree.sirv.com/nope-not-here.jpg?w=150")!
        let data = try? Data(contentsOf: url)
        doctorImage.image = UIImage(data: data!)
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(item: Booking) {
        let url: URL = URL(string: item.doctor?.image ?? "") ?? URL(string: "https://demofree.sirv.com/nope-not-here.jpg?w=150")!
        let data = try? Data(contentsOf: url)
        doctorImage.image = UIImage(data: data!)
        doctorNameLabel.text = item.doctor?.userName
        DateLabel.text = item.date?.setUpcomingBookingDate()
        if item.isCancelled ?? false {
            statusLabel.text = "Canceled"
        } else {
            statusLabel.text = "Completed"
        }
    }
}
