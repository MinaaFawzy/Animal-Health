//
//  TabBarVC.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import UIKit

class TabBarVC: UITabBarController, TabBarViewProtocol {
    
    var presenter: TabBarPresenterProtocol!
    
    //MARK: - Screen Life
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarLayout()
        setVCToTabBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Extension Functions
    func setVCToTabBar() {
        let homeVC = HomeRouter.createModule()
        let bookingVC = BookingRouter.createModule()
        let profileVC = ProfileRouter.createModule()
        let shopVC = ShopRouter.createModule()
        let cartVC = CartRouter.createModule()
        setTitleAndImage(name: "Home", VC: homeVC)
        setTitleAndImage(name: "My Booking", VC: bookingVC)
        setTitleAndImage(name: "Profile", VC: profileVC)
        setTitleAndImage(name: "Shop", VC: shopVC)
        setTitleAndImage(name: "Cart", VC: cartVC)
        self.setViewControllers([homeVC,bookingVC,profileVC,shopVC,cartVC], animated: false)
    }
    
    func setTabBarLayout() {
        self.tabBar.layer.borderColor = UIColor.init(named: "grayBorder")?.cgColor
        self.tabBar.layer.borderWidth = 0.3
        self.tabBar.tintColor = UIColor.init(named: "navigationBar")
  
    }
    
    func setTitleAndImage(name:String , VC: UIViewController) {
        VC.title = name
        VC.tabBarItem.image = UIImage(named: name)
    }
   
    
}

