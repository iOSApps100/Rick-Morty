//
//  RMCharaterViewController.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 19/05/25.
//

import UIKit

final class RMCharaterViewController: UIViewController {

    private let characterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // systemBackground means we are supporting light & white mode.
        view.backgroundColor = .systemBackground
        title = "Characters"
        setUpView()
    }

    private func setUpView() {
        view.addSubview(characterListView)
        // this will set constraint at what place it will show on the view controller.
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            characterListView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            characterListView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            characterListView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }

}
