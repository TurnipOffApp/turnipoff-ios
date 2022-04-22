//
//  PersonOverviewView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 22/04/2022.
//

import SwiftUI

struct PersonOverviewView: View {

    // MARK: Properties

    let person: Person

    // MARK: View

    var body: some View {
        Group {
            if person.biography.isEmpty {
                Text("No biography.")
            } else {
                Text(person.biography)
            }
        }
        .padding()
    }

}
