//
//  RMRequest.swift
//  Rick&Morty
//
//  Created by Vikram Kumar on 20/05/25.
//
import Foundation

final class RMRequest {
    //NOTE: some points are optionals
    
    //1 Base URL
    //2 Endpoint
    //3 path components
    //4 query parameters
    //https://rickandmortyapi.com/api/character/2
    
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndPoint
    
    private let pathComponents: [String]
    
    private let queryParameters: [URLQueryItem]
    
    private var urlString: String {
        
        var string  = Constants.baseURL
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach {
                string += "/\($0)"
            }
        }

        if !queryParameters.isEmpty {
            string += "?"
            // name=value&name=value
            let argumentString = queryParameters.compactMap {
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }.joined(separator: "&")
            string += argumentString
            
        }

        
        return string
    }
    
    public let httpMethod: String = "GET"
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    init(endpoint: RMEndPoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension RMRequest {
    static let listCharactersRequest = RMRequest(endpoint: .character)
}
