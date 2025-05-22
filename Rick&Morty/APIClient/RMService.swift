//
//  RMService.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 20/05/25.
//

final class RMService {
     static let shared = RMService()
    private init() {}
    
    public func execute<T: Codable>(_ request: RMRequest, excepting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
