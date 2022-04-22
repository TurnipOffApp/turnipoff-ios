//
//  PersonView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 22/04/2022.
//

import SwiftUI

struct PersonView: View {

    @StateObject var viewModel: PersonViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let person = viewModel.person, let credits = viewModel.credits {
                    PersonHeaderView(person: person)
                        .frame(height: 220)
                    Divider()
                    PersonDescriptionView(
                        person: person,
                        credits: credits
                    )
                    Divider()
                    PersonOverviewView(person: person)
                    Divider()
                    CreditsView(credits: credits)
                }
            }
        }
        .navigationTitle("Person details")
        .onAppear(perform: viewModel.refreshData)
    }
}
