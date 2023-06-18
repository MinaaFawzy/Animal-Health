//
//  CartProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import Foundation

protocol CartViewProtocol: AnyObject {
    var presenter: CartPresenterProtocol! { get set }
}

protocol CartPresenterProtocol: AnyObject {
    var view: CartViewProtocol? { get set }
}

protocol CartRouterProtocol {
    
}

protocol CartInteractorInputProtocol {
    var presenter: CartInteractorOutputProtocol? { get set }
}

protocol CartInteractorOutputProtocol: AnyObject {
    
}
