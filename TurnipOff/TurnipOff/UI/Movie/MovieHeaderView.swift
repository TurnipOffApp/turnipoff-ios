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
                url: PictureSizes.backdrop(.w700).builURL(for: movie.backdropPath),
                contentMode: .fill
            )
            .blur(radius: 5)

            ImageURL(
                url: PictureSizes.poster(.w500).builURL(for: movie.posterPath),
                contentMode: .fit
            )
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()

        }
    }

}
