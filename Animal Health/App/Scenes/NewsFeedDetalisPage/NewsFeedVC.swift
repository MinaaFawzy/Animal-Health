//
//  NewsFeedVC.swift
//  Animal Health App
//
//  Created by OSX on 07/09/2022.
//  
//

import UIKit

class NewsFeedVC: UIViewController, NewsFeedViewProtocol,  UICollectionViewDelegate, UICollectionViewDataSource {
        
    //MARK: - Variables
    var ReferenceFlag: Bool = true
    var presenter: NewsFeedPresenterProtocol!
  
    //MARK: - @IBOUTLETS
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var articleTxt: UILabel!
    @IBOutlet weak var referenceImage: UIImageView!
    @IBOutlet weak var articleReferenceLabel: UILabel!
    @IBOutlet weak var relatedArticlesCollection: UICollectionView!
    @IBOutlet weak var autherNameLabel: UILabel!
    @IBOutlet weak var articleReferenceView: UIView!
    
    @IBOutlet weak var ReferenceView: UIView!
    //MARK: - screen Life
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setData()
        collectionSetup()
        setLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - @IBACTIONS
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter.backButtonWasPressed()
    }
    @IBAction func referenceButtonPressed(_ sender: Any) {
        if ReferenceFlag {
            articleReferenceView.isHidden = false
            ReferenceFlag = false
            referenceImage.image = UIImage(named: "upArrow")
        } else {
            articleReferenceView.isHidden = true
            ReferenceFlag = true
            referenceImage.image = UIImage(named: "downArrow")
        }
    }
    
    //MARK: - Collection Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as RelatedArticlesCell
        return cell
    }
    
    //MARK: - Extension Functions
    func collectionLayout(_ collection: UICollectionView) {
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (relatedArticlesCollection.bounds.width)/2.5, height: 200.0)
        layout.minimumInteritemSpacing = 10.0
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        collection.setCollectionViewLayout(layout, animated: true)
        
    }
    func setData() {
        let date = presenter.articleDetails?.publishDate?.covertTimeToText()
        articleDate.text = date
        
        let url: URL = URL(string: presenter.articleDetails?.image ?? "") ?? URL(string: "https://demofree.sirv.com/nope-not-here.jpg?w=150")!
        let data = try? Data(contentsOf: url)
        articleImage.image = UIImage(data: data!)
        
        articleTxt.text = presenter.articleDetails?.body
        
        autherNameLabel.text = presenter.articleDetails?.authorName
        
        let reference: [String] = presenter.articleDetails?.reference ?? []
        if reference.count == 0 {
            ReferenceView.isHidden = true
        } else {
            for item in reference {
                articleReferenceLabel.text! += item + "\n\n"
            }
        }
        articleTitle.text = presenter.articleDetails?.title
    }
    
    func collectionSetup() {
        relatedArticlesCollection.delegate = self
        relatedArticlesCollection.dataSource = self
        relatedArticlesCollection.registerNib(cell: RelatedArticlesCell.self)
        collectionLayout(relatedArticlesCollection)
  
    }
    func setLayout() {
        articleImage.layer.cornerRadius = 20
        articleReferenceView.isHidden = true
        relatedArticlesCollection.isHidden = true
        
    
    }
}

