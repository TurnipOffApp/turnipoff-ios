//
//  MovieView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import SwiftUI

struct MovieView: View {

    @StateObject var viewModel: MovieViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let movie = viewModel.movie {
                MovieHeaderView(movie: movie)
                    .frame(height: 220)
                Divider()
                MovieDescriptionView(movie: movie)
            }
            Spacer()
        }
        .onAppear(perform: viewModel.refreshMovie)
    }
}
