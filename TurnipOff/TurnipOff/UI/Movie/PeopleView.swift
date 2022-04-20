//
//  PeopleView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import SwiftUI

struct PeopleView: View {

    // MARK: Properties

    let people: People

    // MARK: View

    var body: some View {
        VStack(alignment: .center) {
            let url = PictureSizes.poster(.w185).builURL(for: people.profilePath)
            ImageURL(
                url: PictureSizes.poster(.w185).builURL(for: people.profilePath),
                contentMode: .fill
            )
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
            .frame(width: 80, height: 100)

            Text(people.name)
                .font(.subheadline)
            Text(people.role)
                .font(.caption)
            Spacer()
        }
        .frame(width: 120)
    }

}
