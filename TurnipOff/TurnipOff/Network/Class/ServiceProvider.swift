//
//  ServiceProvider.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import Foundation
import Combine

class ServiceProvider<T: Service> {

    private let urlSession: URLSession
    private let plugins: [Plugin]

    init(
        urlSession: URLSession = .shared,
        plugins: [Plugin] = []
    ) {
        self.urlSession = urlSession
        self.plugins = plugins
    }

}

extension ServiceProvider {

    func load<Value: Decodable>(_ service: T) -> AnyPublisher<Value, NetworkError> {

        guard let networkRequest = try? service.urlRequest() else {
            return .fail(NetworkError.invalidRequest)
        }

        let preparedRequest = plugins.reduce(networkRequest) { $1.prepare($0, service: service) }

        return urlSession.dataTaskPublisher(for: preparedRequest)
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
            .decode(type: Value.self, decoder: service.decoder)
            .mapError { NetworkError.handleError($0) }
            .eraseToAnyPublisher()
    }

}
