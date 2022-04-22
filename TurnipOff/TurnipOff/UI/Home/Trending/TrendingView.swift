//
//  TrendingView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import SwiftUI

struct TrendingView: View {

    @StateObject private var viewModel = TrendingViewModel()
    
    var body: some View {
        CarouselView(
            pages: viewModel.movies.map { TrendingMovieView(movie: $0) },
            indexDisplayMode: .always
        )
        .onAppear(perform: viewModel.getTrendingList)
    }
}

struct TrendingMovieView: View {

    let movie: MovieSearch

    var body: some View {
        GeometryReader { geometry in
            VStack {
                let url = PictureSizes.poster(.w342).builURL(for: movie.posterPath)
                NavigationLink(destination: MovieView(viewModel: .init(id: movie.id))) {
                    ImageURLRounded(url: url, contentMode: .fit)
                        .frame(width: geometry.size.width * 0.5)
                        .clipped()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)

        }
    }

}
