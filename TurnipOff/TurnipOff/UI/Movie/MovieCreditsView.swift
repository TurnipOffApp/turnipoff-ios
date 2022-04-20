//
//  MovieCreditsView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import SwiftUI

struct MovieCreditsView: View {

    // MARK: Properties

    let credits: Credits

    // MARK: View

    var body: some View {
        VStack {
            PeopleListView(title: "Cast", people: credits.cast)
            Divider()
            PeopleListView(title: "Crew", people: credits.creww)
        }
        .padding()
    }

}

struct PeopleListView: View {

    // MARK: Properties

    let title: String
    let people: [People]

    // MARK: View

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(people, id: \.id) {
                        PeopleView(people: $0)
                    }
                }
            }
        }
    }

}
