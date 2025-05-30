//
//  RMCharacterCollectionViewCellViewModel.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 28/05/25.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel {
 
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageURL: URL?
    
    init(characterName: String, characterStatus: RMCharacterStatus, characterImageURL: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageURL = characterImageURL
    }
    
    // we are making computed property bcz we dont want to expose 'characterStatus' type.
    public var characterStatusText: String {
        return characterStatus.rawValue
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
