//
//  Extensions.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 27/05/25.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
            
        }
    }
}
