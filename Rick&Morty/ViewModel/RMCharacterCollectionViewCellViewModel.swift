//
//  RMCharacterCollectionViewCellViewModel.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 28/05/25.
//

import Foundation

// we needed to conform this viewModel using hashable&Equatable bcz while fetching more data(pagination) next 20 cells data, it was appending some dublicate data to viewModel even after applying character.name check, so probably some characters are having same name. So this hashable will give us uniques value.
final class RMCharacterCollectionViewCellViewModel: Hashable, Equatable {
    static func == (lhs: RMCharacterCollectionViewCellViewModel, rhs: RMCharacterCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue  == rhs.hashValue
    }
    
 
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageURL: URL?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageURL)
    }
    
    
    init(characterName: String, characterStatus: RMCharacterStatus, characterImageURL: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageURL = characterImageURL
    }
    
    // we are making computed property bcz we dont want to expose 'characterStatus' type.
    public var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        //TODO:- Abstract to Image manager
        guard let url = characterImageURL else {
            //URLError is error type provided by foundation framework.
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse) ))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
