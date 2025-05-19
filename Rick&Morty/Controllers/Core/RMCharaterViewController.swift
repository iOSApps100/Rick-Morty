//
//  RMCharaterViewController.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 19/05/25.
//

import UIKit

final class RMCharaterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // systemBackground means we are supporting light & white mode.
        view.backgroundColor = .systemBackground
        title = "Characters"
    }


}
