//
//  MovieOverviewView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import SwiftUI

struct MovieOverviewView: View {

    // MARK: Properties

    let movie: Movie

    // MARK: View

    var body: some View {
        Group {
            if movie.overview.isEmpty {
                Text("No overview.")
            } else {
                Text(movie.overview)
            }
        }
            .padding()
    }

}
