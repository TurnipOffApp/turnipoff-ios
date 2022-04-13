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
        .frame(height: 500)
        .onAppear(perform: viewModel.getTrendingList)
    }

}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView()
    }
}

struct TrendingMovieView: View {

    let movie: Movie

    var body: some View {
        let url = PictureSizes.poster(.w342).builURL(for: movie.posterPath)
        ImageURL(url: url, contentMode: .fit)
    }

}
