//
//  ImageURLRounded.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import Foundation
import SwiftUI

struct ImageURLRounded: View {

    let url: URL?
    let contentMode: ContentMode

    init(url: URL?, contentMode: ContentMode = .fill) {
        self.url = url
        self.contentMode = contentMode
    }

    var body: some View {
        ImageURL(url: url, contentMode: contentMode)
            .cornerRadius(10)
            .shadow(radius: 5)
    }

}
