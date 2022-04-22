//
//  CreditsView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import SwiftUI

struct CreditsView: View {

    // MARK: Properties

    let credits: Credits

    // MARK: View

    var body: some View {
        VStack {
            CreditsListView(title: "Cast", credit: credits.cast)
            Divider()
            CreditsListView(title: "Crew", credit: credits.crew)
        }
        .padding()
    }

}
