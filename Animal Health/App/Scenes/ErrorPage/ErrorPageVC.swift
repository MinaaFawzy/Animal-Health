//
//  ErrorPageVC.swift
//  Animal Health App
//
//  Created by Mina fawzy on 08/09/2022.
//  
//

import UIKit

class ErrorPageVC: UIViewController, ErrorPageViewProtocol {
    
    //MARK: - Variables
    var presenter: ErrorPagePresenterProtocol!
    
    //MARK: - @IBOUTLETS
    @IBOutlet weak private var backgroundView: UIView!
    @IBOutlet weak private var BackButton: UIButton!
    
    //MARK: - Screen Life
    override func viewDidLoad() {
        super.viewDidLoad()
       setLayout()
    }
    
    //MARK: - Actions
    @IBAction private func backButtonPressed(_ sender: Any) {
        presenter.backButtonWasPressed()
    }
    
    //MARK: - Extension Functions
    func setLayout() {
        backgroundView.setupBackgroundGradient(nil)
        BackButton.layer.cornerRadius = 20
    }
}

