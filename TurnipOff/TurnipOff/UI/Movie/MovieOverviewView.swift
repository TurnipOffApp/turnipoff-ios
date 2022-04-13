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
        Text(movie.overview)
            .padding()
    }

}
