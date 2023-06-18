//
//  RelatedArticlesCell.swift
//  Animal Health App
//
//  Created by OSX on 07/09/2022.
//

import UIKit

class RelatedArticlesCell: UICollectionViewCell {

    //MARK: - @IBOUTLETS
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var TitleAuther: UILabel!
    @IBOutlet weak var relatedArticleTitle: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    
    //MARK: - Screen Life
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 20
        cellView.layer.borderWidth = 1
        cellView.layer.borderColor = UIColor.init(named: "grayBorder")?.cgColor
        articleImage.layer.cornerRadius = 20
        
        let url: URL = URL(string: "") ?? URL(string: "https://demofree.sirv.com/nope-not-here.jpg?w=150")!
        let data = try? Data(contentsOf: url)
        articleImage.image = UIImage(data: data!)
      
    }
    

}
