//
//  HomeVC.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import UIKit

class HomeVC: UIViewController, HomeViewProtocol , UITableViewDelegate , UITableViewDataSource{
    var presenter: HomePresenterProtocol!
    
    //MARK: - @IBOUTLETS
    @IBOutlet weak var bookDoctorView: UIView!
    @IBOutlet weak var postsAndArticlesTable: UITableView!
    @IBOutlet weak var loadingButton: LoadingButton!
    
    //MARK: - Screen Life
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(pageNum: presenter.currentPage)
        bookDoctorView.viewLayout()
        tableSetup()
        setLayout()
    }
    
    //MARK: - @IBACTIONS
    @IBAction func searchButtonPressed(_ sender: Any) {
        presenter.searchButtonWasPressed()
    }
    @IBAction func bookDoctorButtonPressed(_ sender: Any) {
        presenter.bookDoctorButtonWasPressed()
    }
    
    //MARK: - TABLE FUNCTIONS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.newsFeed.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == (presenter.newsFeed.count - 1)) {
            if presenter.currentPage < presenter.totalePages {
                presenter.viewDidLoad(pageNum: presenter.currentPage + 1)
            }
        }
        let cell = tableView.dequeue() as ArticleCell
        cell.setData(item: presenter.newsFeed[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if presenter.newsFeed[indexPath.row].category != "Post" {
            presenter.articleWasSelected(articleDetails: presenter.newsFeed[indexPath.row])
        }
    }
     
    //MARK: - Extension Functions
    func reloadData() {
        postsAndArticlesTable.reloadData()
    }
    func makeAlert(_ alertMassge: String) {
        let alert = UIAlertController(title: "", message: alertMassge, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    func setLayout() {
        loadingButton.showLoading()
        loadingButton.layer.cornerRadius = 20
    }
    
    func tableSetup() {
        postsAndArticlesTable.delegate = self
        postsAndArticlesTable.dataSource = self
        postsAndArticlesTable.registerNib(cell: ArticleCell.self)
    }
    func stopLoadingData() {
            loadingButton.isHidden = true
            loadingButton.hideLoading()
    }
    
    
}


