//
//  VerifyingVC.swift
//  Animal Health App
//
//  Created by OSX on 31/08/2022.
//  
//

import UIKit

class VerifyingVC: UIViewController, VerifyingViewProtocol {
    
    var presenter: VerifyingPresenterProtocol!
    private var counter = 300
    private var TimeEx = false
    
    //MARK: - @IBOUTLETS
    @IBOutlet weak private var backgroundView: UIView!
    @IBOutlet weak private var verifyView: UIView!
    @IBOutlet weak private var verifyTxt: UILabel!
    @IBOutlet weak private var firstNumTF: UITextField!
    @IBOutlet weak private var secondNumTF: UITextField!
    @IBOutlet weak private var thirdNumTF: UITextField!
    @IBOutlet weak private var fourthNumTF: UITextField!
    @IBOutlet weak private var fifthNumTF: UITextField!
    @IBOutlet weak private var sixthNumTF: UITextField!
    @IBOutlet weak private var timeExLabel: UILabel!
    @IBOutlet weak private var sendCodeB: UIButton!
    
    //MARK: - Screen Life
    override func viewDidLoad() {
        super.viewDidLoad()
        setOTPDeleget()
        setScreenLayout()
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
   
    //MARK: - Extension Functions
    func setOTPDeleget() {
        firstNumTF.delegate = self
        secondNumTF.delegate = self
        thirdNumTF.delegate = self
        fourthNumTF.delegate = self
        fifthNumTF.delegate = self
        sixthNumTF.delegate = self
    }
    
    func makeAlert(_ errorMassage: String) {
        let alert = UIAlertController(title: "", message: errorMassage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func setScreenLayout() {
        verifyTxt.text = "\(verifyTxt.text!) \(presenter.phoneNum)"
        backgroundView.setupBackgroundGradient(nil)
        verifyView.viewLayout()
        sendCodeB.layer.borderWidth = 1
        sendCodeB.layer.borderColor = UIColor.init(named: "grayBorder")?.cgColor
        sendCodeB.layer.cornerRadius = 20
    }
   
    @objc func update() {
        if counter >= 0 {
            let minutes = String(counter / 60)
            var seconds = String(counter % 60)
            if seconds.count == 1{
                seconds = "0" + seconds
            }
            timeExLabel.text = "0" + minutes + ":" + seconds
            counter -= 1
        }else{
            sendCodeB.setTitle("Resend Code", for: .normal)
            TimeEx = true
        }

    }
   
}

//MARK: - @IBACTION
extension VerifyingVC {
    
    @IBAction private func backButtonPressed(_ sender: Any) {
        presenter.backButtonWasPressed()
    }
    
    @IBAction private func sendCodeButtonPressed(_ sender: Any) {
        let OTP = "\(firstNumTF.text!)\(secondNumTF.text!)\(thirdNumTF.text!)\(fourthNumTF.text!)\(fifthNumTF.text!)\(sixthNumTF.text!)"
        if TimeEx {
            counter = 300
            sendCodeB.setTitle("Send Code", for: .normal)
            TimeEx = false
        } else {
            presenter.sendCodeWasPressed(OTPCode: OTP)
        }
    }
    
}

//MARK: - UITextField Delegate
extension VerifyingVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text!.count < 1) && (string.count > 0)) {
            if textField == firstNumTF {
                secondNumTF.becomeFirstResponder()
            }
            if textField == secondNumTF {
                thirdNumTF.becomeFirstResponder()
            }
            if textField == thirdNumTF {
                fourthNumTF.becomeFirstResponder()
            }
            if textField == fourthNumTF {
                fifthNumTF.becomeFirstResponder()
            }
            if textField == fifthNumTF {
                sixthNumTF.becomeFirstResponder()
            }
            if textField == sixthNumTF {
                sixthNumTF.resignFirstResponder()
            }
            textField.text = string
            return false
        }
        return true
    }
    
}
