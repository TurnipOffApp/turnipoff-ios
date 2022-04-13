//
//  TestViewModel.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 12/04/2022.
//

import Combine

#warning("remove test purpose")
final class TestViewModel: ObservableObject {

    private var cancellable: AnyCancellable?

    init() {
        cancellable = TMDBClient.shared.discover().sink { completion in
            dump(completion)
        } receiveValue: { value in
            dump(value)
        }
    }
}
