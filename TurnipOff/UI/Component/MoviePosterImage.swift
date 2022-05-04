//
//  MoviePosterImage.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import Foundation
import SwiftUI

struct MoviePosterImage: View {

    private let url: URL?

    init(_ url: URL?) {
        self.url = url
    }

    var body: some View {
        ImageURL(
            url: url,
            contentMode: .fit,
            ratio: 2/3
        )
        .cornerRadius(10)
    }

}
