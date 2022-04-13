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
        ScrollView {
            VStack(alignment: .leading) {
                if let movie = viewModel.movie {
                    MovieHeaderView(movie: movie)
                        .frame(height: 220)
                    Divider()
                    MovieDescriptionView(movie: movie)
                    Divider()
                    MovieOverviewView(movie: movie)
                }
            }
        }
        .navigationTitle("Movie details")
        .onAppear(perform: viewModel.refreshMovie)
    }
}
