//
//  PersonHeaderView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 22/04/2022.
//

import SwiftUI

struct PersonHeaderView: View {

    let person: Person

    var body: some View {
        HStack() {
            Spacer()
            MoviePosterImage(
                PictureSizes.poster(.w185).builURL(for: person.profilePath)
            )
            Spacer()
        }
        .padding()
    }

}

