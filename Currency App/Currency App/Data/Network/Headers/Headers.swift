//
//  Headers.swift
//  Currency App
//
//  Created by David Santiago Londono Giraldo on 2/04/23.
//

import Foundation

class Headers: ObservableObject {
    
    func headers(url: URL, method: String, key: String, body: Data?) -> URLRequest {
        var request = URLRequest(url: url)
        request.addValue(ConstantsConfiguration.apiKey, forHTTPHeaderField: ConstantsText.apiKey)
        request.httpMethod = method
        request.httpBody = body
        return request
    }
}
