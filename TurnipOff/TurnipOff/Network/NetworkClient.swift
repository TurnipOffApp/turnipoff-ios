//
//  NetworkClient.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 12/04/2022.
//

import Foundation
import Combine

final class NetworkClient {

    private static var dateFormatter: DateFormatter = {
        let aoDateFormatter = DateFormatter()
        aoDateFormatter.dateFormat = "yyyy-dd-MM"
        return aoDateFormatter
    }()

    private static var decoder: JSONDecoder {
        let aoJSONDecoder = JSONDecoder()
        aoJSONDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return aoJSONDecoder
    }

    static let shared = NetworkClient()
    private let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
}

extension NetworkClient {

    func performRequest<Value: Decodable>(_ request: Request) -> AnyPublisher<Value, Error> {
        guard let networkRequest = try? request.urlRequest() else {
            return .fail(NetworkError.invalidRequest)
        }

        return urlSession.dataTaskPublisher(for: networkRequest)
            .mapError { _ in NetworkError.invalidRequest }
            .flatMap { data, response -> AnyPublisher<Data, Error> in
                guard let response = response as? HTTPURLResponse else {
                    return .fail(NetworkError.unknownError)
                }

                guard 200..<300 ~= response.statusCode else {
                    return .fail(NetworkError.httpError(response.statusCode))
                }
                return .just(data)
            }
            .decode(type: Value.self, decoder: Self.decoder)
            .mapError { NetworkError.handleError($0) }
            .print()
            .eraseToAnyPublisher()
    }

}
