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
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    if let movie = viewModel.movie {
                        MovieHeaderView(movie: movie)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
                        Divider()
                        MovieDescriptionView(movie: movie)
                        Divider()
                        MovieOverviewView(movie: movie)
                    }
                    if let credits = viewModel.credits {
                        Divider()
                        CreditsView(credits: credits)
                            .frame(height: geometry.size.height * 0.75)
                    }
                }
                .frame(width: geometry.size.width)
            }
            .navigationTitle("Movie details")
            .onAppear(perform: viewModel.refreshData)
        }
    }
}
