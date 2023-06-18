//
//  NewsFeedSearchVC.swift
//  Animal Health App
//
//  Created by OSX on 04/09/2022.
//  
//

import UIKit

class NewsFeedSearchVC: UIViewController, NewsFeedSearchViewProtocol, UITableViewDelegate, UITableViewDataSource{
    
    var presenter: NewsFeedSearchPresenterProtocol!
    
    //MARK: - @IBOUTLETS
    @IBOutlet weak var loadingButton: LoadingButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var SearchTable: UITableView!
    @IBOutlet weak var searchTF: UITextField!
    
    //MARK: - Screen Life
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        tableSetup()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
        
    //MARK: - @IBATIONS
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter.backButtonWasPressed()
    }
    @IBAction func searchButtonPressed(_ sender: Any) {
        presenter.searchedNews = []
        presenter.currentPage = 1
        loadingButton.isHidden = false
        loadingButton.showLoading()
        presenter.searchButonWasPressed(keyWord: searchTF.text ?? "", page: presenter.currentPage )
    }

    //MARK: - Table Extension
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.searchedNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == (presenter.searchedNews.count - 1) {
            presenter.searchButonWasPressed(keyWord: searchTF.text!, page: presenter.currentPage + 1 )
        }
        let cell = tableView.dequeue() as ArticleCell
        cell.setData(item: presenter.searchedNews[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if presenter.searchedNews[indexPath.row].category != "Post" {
            presenter.newsDetailsWasPressed(articleDetails: presenter.searchedNews[indexPath.row])
        }
    }
    
    
    //MARK: - Extension Function
    func reloadData() {
        SearchTable.reloadData()
    }
    
    func makeAlert(_ alertMassge: String) {
        let alert = UIAlertController(title: "", message: alertMassge, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func tableSetup() {
        SearchTable.registerNib(cell: ArticleCell.self)
        SearchTable.delegate = self
        SearchTable.dataSource =  self
    }
    
    func setLayout() {
        loadingButton.isHidden = true
        loadingButton.layer.cornerRadius = 20
        searchButton.layer.cornerRadius = 10
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
   
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
 
    
    func stopLoadingData() {
        loadingButton.isHidden = true
        loadingButton.hideLoading()
    }
    
}


