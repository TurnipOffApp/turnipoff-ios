//
//  SectionView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import SwiftUI

struct SectionView: View {

    @StateObject var viewModel: SectionViewModel

    var body: some View {
        VStack {
            let title = ["Worst", viewModel.config.category.title, "movies"].joined(separator: " ")
            Text(title)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(viewModel.movies) { movie in
                        let url = PictureSizes.poster(.w342).builURL(for: movie.posterPath)
                        NavigationLink(destination: MovieView(viewModel: .init(id: movie.id))) {
                            ImageURLRounded(url: url, contentMode: .fit)
                                .padding()
                                .onAppear {
                                    viewModel.loadMoreMoviesIfNeeded(currentMovie: movie)
                                }
                        }
                    }
                }
            }
        }
        .onAppear(perform: viewModel.getMovies)
    }

}
