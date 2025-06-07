//
//  RMCharacterDetailViewViewModel.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 04/06/25.
//

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
