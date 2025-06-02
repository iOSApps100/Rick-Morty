//
//  CharacterListViewViewModel.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 27/05/25.
//

import UIKit

protocol RMCharacterListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacter()
}

final class RMCharacterListViewViewModel: NSObject {
    
    private var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
    public weak var delegate: RMCharacterListViewViewModelDelegate? = nil
    
    private var characters: [RMCharacter] = [] {
        
        didSet {
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellViewModel(characterName: character.name, characterStatus: character.status, characterImageURL: URL(string: character.image))
                cellViewModels.append(viewModel)
            }
        }
    }
    
    
    func fetchCharacters() {
        
//        RMService.shared.execute(RMRequest.self, excepting: RMGetAllCharactersResponse.self) { result in
//            switch result {
//            case .success(let model):
//                print(model.info.count)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = cellViewModels[indexPath.row]
        cell.configure(with: viewModel)
        cell.backgroundColor = .systemPink
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
        
    }
}
