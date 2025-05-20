//
//  RMService.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 20/05/25.
//

final class RMService {
     static let shared = RMService()
    private init() {}
    
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
