//
//  ProfileVC.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import UIKit

class ProfileVC: UIViewController, ProfileViewProtocol {
    
    var presenter: ProfilePresenterProtocol!
    //MARK: - @IBOUTLETS
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var CustomerImage: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    
    //MARK: - Screen Life
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.layer.cornerRadius = 20
        CustomerImage.layer.cornerRadius = 20
        backgroundView.setupBackgroundGradient(nil)
        
    }
    
    //MARK: - @IBACTIONS
    @IBAction func LogoutButtonPressed(_ sender: Any) {
        presenter.logoutButtonWasPressed()
    }
    
}

