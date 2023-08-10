//
//  Extensions.swift
//  marketCoins
//
//  Created by Giovani Prado on 10/08/23.
//

import Foundation

extension URL {
    
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems else { return nil }
        
        var items: [String: String] = [:]
        
        for queryItem in queryItems {
            items[queryItem.name] = queryItem.value
        }
        
        return items
    }
    func appendingQueryParameters(path: String, parameters: [String: String]? = nil) -> URL? {
        guard var urlComponents = URLComponents(url: self,  resolvingAgainstBaseURL: true) else {return nil}
        
        guard let parameters = parameters else {
            guard let url = urlComponents.url else { return nil}
            return url.appendingPathComponent(path)
        }
   
    
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + parameters.map { URLQueryItem(name: $0, value: $1) }
        guard let url = urlComponents.url else { return nil }
        return url.appendingPathComponent(path)
    }
}
