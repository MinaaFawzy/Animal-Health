//
//  ShopProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import Foundation

protocol ShopViewProtocol: AnyObject {
    var presenter: ShopPresenterProtocol! { get set }
}

protocol ShopPresenterProtocol: AnyObject {
    var view: ShopViewProtocol? { get set }
}

protocol ShopRouterProtocol {
    
}

protocol ShopInteractorInputProtocol {
    var presenter: ShopInteractorOutputProtocol? { get set }
}

protocol ShopInteractorOutputProtocol: AnyObject {
    
}
