//
//  RegisterVC.swift
//  Animal Health App
//
//  Created by MoOoN on 30/08/2022.
//  
//

import UIKit

class RegisterVC: UIViewController, RegisterViewProtocol {
    
    var presenter: RegisterPresenterProtocol!
    
    //MARK: - @IBOUTLETS
    @IBOutlet weak private var createAccountView: UIView!
    @IBOutlet weak private var nameTF: UITextField!
    @IBOutlet weak private var mobileNoTF: UITextField!
    @IBOutlet weak private var passwordTF: UITextField!
    @IBOutlet weak private var confirmPasswordTF: UITextField!
    @IBOutlet weak private var signInButton: LoadingButton!
    @IBOutlet weak private var createAccountLabelView: UIView!
    @IBOutlet weak private var backgroundView: UIView!
    
    //MARK: - Screen Life
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - EXSTENSION FUNCTIONS
    func makeAlert(_ alertMassge: String){
        let alert = UIAlertController(title: "", message: alertMassge, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    func setLayout() {
        signInButton.layer.cornerRadius = 20
        backgroundView.setupBackgroundGradient(nil)
        createAccountView.viewLayout()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
   
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
 
    func loadingData(buttonFlage: Bool) {
        if buttonFlage {
            signInButton.showLoading()
        }
        else {
            signInButton.hideLoading()
        }
    }
    
}

//MARK: - ACTIONS
extension RegisterVC {
    
    @IBAction func singnInPressed(_ sender: Any) {
        signInButton.showLoading()
        let buttonFlag = presenter.signInButtonPressed(
            name: nameTF.text!,
            phoneNumber: mobileNoTF.text!,
            password: passwordTF.text!,
          confirmPassword: confirmPasswordTF.text!
        )
        loadingData(buttonFlage: buttonFlag)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        presenter.backButtonWasPressed()
    }
    
}
