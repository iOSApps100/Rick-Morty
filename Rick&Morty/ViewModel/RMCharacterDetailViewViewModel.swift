//
//  RMCharacterDetailViewViewModel.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 04/06/25.
//
import Foundation


final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    
    
    /// We are going to use these enum types to get to know which layout we need, we make it CaseIterable.
    enum SectionType: CaseIterable {
        case photo
        case information
        case episodes
    }
    
    public let sections = SectionType.allCases
    
    //MARK:- init()
    init(character: RMCharacter) {
        self.character = character
    }
    
    private var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
    public func fetchCharacterData() {
        print(character.url)// https://rickandmortyapi.com/api/character/1
        guard let url = requestUrl, let request = RMRequest(url: url) else {
            return
        }
        print(request.url)// Optional(https://rickandmortyapi.com/api/character)
        //we are not adding '/1' pathComponent here.we will change this in RMRequest() class see there.
        
//        RMService.shared.execute(request, excepting: RMCharacter.self) { result in
//            
//            switch result {
//            case .success(let success):
//                print(String(describing: success))
//            case .failure(let failure):
//                print(String(describing: failure))
//            }
//        }
    }
}
