//
//  CollectionExtenion.swift
//  Animal Health App
//
//  Created by OSX on 10/09/2022.
//

import UIKit

extension UICollectionView {
    
    func registerNib<Cell: UICollectionViewCell>(cell: Cell.Type) {
        let nibName = String(describing: cell.self)
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: nibName)
    }
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell {
        let nibName = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: nibName, for: indexPath) as? Cell else {
            fatalError("Error")
        }
        return cell
    }
    
}
