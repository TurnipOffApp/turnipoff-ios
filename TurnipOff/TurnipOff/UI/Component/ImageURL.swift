//
//  ImageURL.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import Foundation
import SwiftUI

struct ImageURL: View {

    let url: URL?
    let contentMode: ContentMode

    init(url: URL?, contentMode: ContentMode = .fill) {
        self.url = url
        self.contentMode = contentMode
    }

    var body: some View {
        ImageAsync(
            url: url,
            transaction: .init(animation: .linear),
            content: { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: contentMode)
                case .failure:
                    Text("Error")
                case .empty:
                    Text("No image")
                }
            }
        )
    }

}
