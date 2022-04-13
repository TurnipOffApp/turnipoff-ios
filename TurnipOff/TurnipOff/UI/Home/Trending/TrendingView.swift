//
//  TrendingView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import SwiftUI

struct TrendingView: View {

    @ObservedObject private var viewModel = TrendingViewModel()
    
    var body: some View {
        CarouselView(
            pages: viewModel.movies.map { PosterView(movie: $0) },
            indexDisplayMode: .always
        )
        .frame(height: 200)
        .onAppear {
            viewModel.getTrendingList()
        }
    }

}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView()
    }
}

struct PosterView: View {

    let movie: Movie

    var body: some View {
        #warning("display image")
        Text(movie.title)
    }

}
