//
//  Service.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import Foundation

protocol Service {

    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem] { get }
    var method: ServiceMethod { get }
    var contentType: ContentType { get }
    var decoder: JSONDecoder { get }

}

extension Service {

    var parameters: [URLQueryItem] { [] }

    func urlRequest() throws -> URLRequest {
        let url = try url()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }

}

private extension Service {

    func url() throws -> URL {
        var components = URLComponents(string: baseURL)
        components?.path += path

        components?.queryItems = parameters

        guard let url = components?.url else {
            throw NetworkError.invalidRequest
        }

        return url
    }
}
