//
//  RMService.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 20/05/25.
//
import Foundation

final class RMService {
     static let shared = RMService()
    private init() {}
    
    enum RMServiceError: Error {
        case failedToCreateURLRequest
        case failedToGetData
    }
    
    public func execute<T: Codable>(_ request: RMRequest, excepting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateURLRequest))
            return
        }
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
        }
        
        
    }
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
