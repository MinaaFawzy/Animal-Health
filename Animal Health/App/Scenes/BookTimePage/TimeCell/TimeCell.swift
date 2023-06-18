//
//  TimeCell.swift
//  Animal Health App
//
//  Created by OSX on 06/09/2022.
//

import UIKit

class TimeCell: UICollectionViewCell {

    //MARK: - @IBOUTLETS
    @IBOutlet weak var availableTimeLabel: UILabel!
    @IBOutlet weak var availableTimeView: UIView!
   
    //MARK: - Screen Life
    override func awakeFromNib() {
        super.awakeFromNib()
        availableTimeView.viewLayout()
    }

}
