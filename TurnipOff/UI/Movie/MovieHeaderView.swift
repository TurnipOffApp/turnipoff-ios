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
        ZStack {
            ImageURL(
                url: PictureSizes.backdrop(.w780).builURL(for: movie.backdropPath),
                contentMode: .fill
            )
            .blur(radius: 5)

            MoviePosterImage(
                PictureSizes.poster(.w185).builURL(for: movie.posterPath)
            )
            .cornerRadius(10)
            .padding()

        }
    }

}
