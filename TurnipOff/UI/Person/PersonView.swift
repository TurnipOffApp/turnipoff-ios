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
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    if let person = viewModel.person, let credits = viewModel.credits {
                        PersonHeaderView(person: person)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
                        Divider()
                        PersonDescriptionView(
                            person: person,
                            credits: credits
                        )
                        Divider()
                        PersonOverviewView(person: person)
                        Divider()
                        CreditsView(credits: credits)
                            .frame(height: geometry.size.height * 0.75)
                    }
                }
            }
            .navigationTitle("Person details")
            .onAppear(perform: viewModel.refreshData)
        }
    }
}
