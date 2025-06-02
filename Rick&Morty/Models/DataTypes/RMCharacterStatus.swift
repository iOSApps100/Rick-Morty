//
//  RMCharacterStatus.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 20/05/25.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    // we are creating this computed property here because when these status shows on cell unknown is not capitalize like other, we can not  simply change it to capitalize bcz it directly link to api response, lets learn with some new approches.
    var text: String {
       switch self {
       case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
