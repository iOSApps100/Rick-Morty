//
//  CharacterListView.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 27/05/25.
//

import UIKit

//View that will handles showing list of character, loader etc.
final class CharacterListView: UIView {

    private let viewModel = CharacterListViewViewModel()
    
    //this is called anonymous closure
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        //Setting translatesAutoresizingMaskIntoConstraints to false prevents a view's autoresizing mask from being automatically translated into Auto Layout constraints. This is crucial when you want to use Auto Layout to manage the view's positioning and sizing dynamically, rather than relying on the autoresizing mask. If you don't set it to false, conflicts may arise between the constraints derived from the autoresizing mask and those you manually define, potentially causing layout issues
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //Initially it will be hidden
       collectionView.isHidden = true
        
        collectionView.alpha = 0
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(collectionView, spinner)
        spinner.startAnimating()
        viewModel.fetchCharacters()
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.spinner.stopAnimating()
            self.collectionView.isHidden = false
            
            
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        }
    }

}
