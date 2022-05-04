//
//  CreditView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import SwiftUI

struct CreditView: View {

    // MARK: Properties

    let credit: Credit

    // MARK: View

    var body: some View {
        VStack(alignment: .center) {
            NavigationLink(destination: self.destination) {
                MoviePosterImage(
                    PictureSizes.poster(.w342).builURL(for: credit.imagePath)
                )
            }

            Text(credit.title)
                .font(.subheadline)
            Text(credit.role ?? "No data")
                .font(.caption)
            Spacer()
        }
    }

    @ViewBuilder
    private var destination: some View {
        switch credit.type {
        case .movie:
            MovieView(viewModel: .init(id: credit.id))
        case .person:
            PersonView(viewModel: .init(id: credit.id))
        }
    }

}
