//
//  RMCharacterDetailView.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 04/06/25.
//

import UIKit
// View for single character info in detail view.
class RMCharacterDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false // means we are giving constraints from here not from storyboard.
        backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
