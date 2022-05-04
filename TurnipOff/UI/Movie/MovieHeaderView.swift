//
//  MovieHeaderView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import SwiftUI

struct MovieHeaderView: View {

    let movie: Movie

    var body: some View {
        HStack() {
            Spacer()
            MoviePosterImage(
                PictureSizes.poster(.w500).builURL(for: movie.posterPath)
            )
            Spacer()
        }
        .padding()
    }

}
