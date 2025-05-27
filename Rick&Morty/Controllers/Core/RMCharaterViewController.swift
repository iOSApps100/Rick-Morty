//
//  RMCharaterViewController.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 19/05/25.
//

import UIKit

final class RMCharaterViewController: UIViewController {

    private let characterListView = CharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // systemBackground means we are supporting light & white mode.
        view.backgroundColor = .systemBackground
        title = "Characters"
        view.addSubview(characterListView)
        // this will set constraint at what place it will show.
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            characterListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }


}
