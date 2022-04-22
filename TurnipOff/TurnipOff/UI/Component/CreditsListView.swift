//
//  CreditsListView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 22/04/2022.
//

import SwiftUI

struct CreditsListView: View {

    // MARK: Properties

    let title: String
    let credit: [Credit]

    // MARK: View

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(credit, id: \.internalID) {
                        CreditView(credit: $0)
                    }
                }
            }
        }
    }

}
