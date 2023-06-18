//
//  TabBarProtocolswift.swift
//  Animal Health App
//
//  Created by OSX on 01/09/2022.
//  
//

import Foundation

protocol TabBarViewProtocol: AnyObject {
    var presenter: TabBarPresenterProtocol! { get set }
}

protocol TabBarPresenterProtocol: AnyObject {
    var view: TabBarViewProtocol? { get set }
}

protocol TabBarRouterProtocol {
    
}

protocol TabBarInteractorInputProtocol {
    var presenter: TabBarInteractorOutputProtocol? { get set }
}

protocol TabBarInteractorOutputProtocol: AnyObject {
    
}
