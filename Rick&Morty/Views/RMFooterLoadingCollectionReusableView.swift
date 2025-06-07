//
//  RMFooterLoadingCollectionReusableView.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 07/06/25.
//

import UIKit

// We need to register & dequeue it
final class RMFooterLoadingCollectionReusableView: UICollectionReusableView {
    static let identifier = "RMFooterLoadingCollectionReusableView"
    
    //this is called anonymous closure
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        //Setting translatesAutoresizingMaskIntoConstraints to false prevents a view's autoresizing mask from being automatically translated into Auto Layout constraints. This is crucial when you want to use Auto Layout to manage the view's positioning and sizing dynamically, rather than relying on the autoresizing mask. If you don't set it to false, conflicts may arise between the constraints derived from the autoresizing mask and those you manually define, potentially causing layout issues
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubviews(spinner)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    public func startAnimating() {
        spinner.startAnimating()
    }
        
}
