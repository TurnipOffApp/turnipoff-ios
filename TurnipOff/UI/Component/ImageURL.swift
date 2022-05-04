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
    let ratio: CGFloat?

    init(url: URL?, contentMode: ContentMode = .fill, ratio: CGFloat? = nil) {
        self.url = url
        self.contentMode = contentMode
        self.ratio = ratio
    }

    var body: some View {
        ImageAsync(
            url: url,
            transaction: .init(animation: .none),
            content: { phase in
                self.image(from: phase)
                    .resizable()
                    .aspectRatio(ratio, contentMode: contentMode)
            }
        )
    }

}

private extension ImageURL {

    func image(from phase: ImageAsyncPhase) -> Image {
        let imagee: Image
        switch phase {
        case .success(let image):
            imagee = image
        case .failure, .empty:
            imagee = Image("missing_picture")
        }
        return imagee
    }
}
