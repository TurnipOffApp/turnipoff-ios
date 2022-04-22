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
                ImageURLRounded(
                    url: PictureSizes.poster(.w342).builURL(for: credit.imagePath),
                    contentMode: .fit
                )
            }
            .frame(width: 80, height: 100)
            .clipped()

            Text(credit.title)
                .font(.subheadline)
            Text(credit.role)
                .font(.caption)
            Spacer()
        }
        .frame(width: 120)
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
