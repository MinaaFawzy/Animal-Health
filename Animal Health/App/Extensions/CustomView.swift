//
//  GetInfoView.swift
//  Animal Health
//
//  Created by OSX on 31/08/2022.
//

import UIKit

class CustomView: UIView {

    override func draw(_ rect: CGRect) {
    }
}

public extension UIView {
    
    func setupBackgroundGradient(_ colors: [Any]?) {
        let fColor = UIColor.init(named: "cyan")!.cgColor
        let myColors =  [
            fColor,
            fColor,
            UIColor.white.cgColor,
            UIColor.white.cgColor
        ]
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        if colors != nil {
            gradientLayer.colors = colors
        } else {
            gradientLayer.colors = myColors
        }
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    func viewLayout(){
        self.layer.cornerRadius = 20
        self.layer.shadowRadius = 16
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = .init(width: 0.0, height: 8.0)
    }
    
}
