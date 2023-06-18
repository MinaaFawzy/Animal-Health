//
//  LoginVC.swift
//  Animal Health App
//
//  Created by MoOoN on 30/08/2022.
//  
//

import UIKit

class LoginVC: UIViewController, LoginViewProtocol {
    
    var presenter: LoginPresenterProtocol!
    
    //MARK: - IBOUTLETS
    @IBOutlet weak private var loginView: UIView!
    @IBOutlet weak private var mobileNoTF: UITextField!
    @IBOutlet weak private var loginButton: LoadingButton!
    @IBOutlet weak private var passwordTF: UITextField!
    @IBOutlet weak private var backgroundView: UIView!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }

    //MARK: - Methods
    func makeAlert(_ alertMassge: String) {
        let alert = UIAlertController(title: "", message: alertMassge, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func setLayout() {
        self.loginButton.layer.cornerRadius = 20
        loginView.viewLayout()
        let fColor = UIColor.init(named: "cyan")!.cgColor
        let colors =  [
            fColor,
            UIColor.white.cgColor]
        backgroundView.setupBackgroundGradient(colors)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
   
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func loadingData(buttonFlage: Bool) {
        if buttonFlage {
            loginButton.showLoading()
        }
        else {
            loginButton.hideLoading()
        }
    }
    
   
}

//MARK: - Actions
extension  LoginVC {
    
    @IBAction private func loginPressed(_ sender: Any) {
        loginButton.showLoading()
        let buttonFlag = presenter.loginButtonWasPressed(phoneNumber: mobileNoTF.text!, pass: passwordTF.text!)
        loadingData(buttonFlage: buttonFlag)
    }
    
    @IBAction private func createAccountPressed(_ sender: Any) {
        presenter.createAccountButtonWasPressed()
    }
    
    @IBAction private func skipButtonPressed(_ sender: Any) {
        presenter.skipButtonPressed()
    }
    
}
