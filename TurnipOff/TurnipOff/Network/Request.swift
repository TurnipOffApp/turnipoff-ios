//
//  Request.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 12/04/2022.
//

import Foundation

struct Request {

    let endpoint: Endpoint
    let method: HTTPMethod
    let contentType: ContentType
    let body: Data? = nil
    let headers: HTTPHeaders? = nil

}

extension Request {

    func urlRequest() throws -> URLRequest {
        let url = try endpoint.url()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = body
        urlRequest.allHTTPHeaderFields = headers
        // no cache
        urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        return urlRequest
    }
}

typealias HTTPHeaders = [String: String]

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum ContentType {
    case json

    var value: String {
        switch self {
        case .json: return "application/json"
        }
    }
}
