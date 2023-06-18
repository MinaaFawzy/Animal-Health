//
//  ArticleCell.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    //MARK: - Variables
    let formatter = DateFormatter()
    var myLableHeight = 0
    
    //MARK: - @IBOUTLES
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var dateTF: UILabel!
    @IBOutlet weak var txtTF: UILabel!
    @IBOutlet weak var autherNameLable: UILabel!
    
    @IBOutlet weak var lableHeight: NSLayoutConstraint!
    //MARK: - Screen Life
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.viewLayout()
        articleImage.layer.cornerRadius = 20
    }
    
    //MARK: - Extension Finctions
    func setData(item: NewsFeed) {
        formatter.dateFormat = "yyyy-MM-dd"
        let date = item.publishDate?.covertTimeToText()
        
        autherNameLable.text = item.authorName
        
        txtTF.text = item.text
        
        dateTF.text = date
        
        if item.image != nil || item.category != "Post"{
            articleImage.isHidden = false
            let url: URL = URL(string: item.image ?? "") ?? URL(string: "https://demofree.sirv.com/nope-not-here.jpg?w=150")!
            let data = try? Data(contentsOf: url)
            articleImage.image = UIImage(data: data!)
            
        }else{
            articleImage.isHidden = true
        }
       
    }
    
}
