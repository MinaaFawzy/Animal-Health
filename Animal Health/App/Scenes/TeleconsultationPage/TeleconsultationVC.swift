//
//  TeleconsultationVC.swift
//  Animal Health App
//
//  Created by OSX on 06/09/2022.
//  
//

import UIKit

class TeleconsultationVC: UIViewController, TeleconsultationViewProtocol {
   
    var presenter: TeleconsultationPresenterProtocol!
    
    //MARK: - @IBOUTLETS
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var waitMassage: UILabel!
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    //MARK: - Screen Lfie
    override func viewDidLoad() {
        super.viewDidLoad()
        setScreenLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - @IBACTIONS
    @IBAction func videoButtonPressed(_ sender: Any) {
    }
    @IBAction func chatButtonPressed(_ sender: Any) {
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        presenter.cancelButtonWasPressed()
    }
    @IBAction func micButtonPressed(_ sender: Any) {
    }

    //MARK: -Extension Functions
    func setScreenLayout() {
        micButton.layer.cornerRadius = 25
        videoButton.layer.cornerRadius = 25
        cancelButton.layer.cornerRadius = 30
        chatButton.layer.cornerRadius = 25
    }
}

