//
//  PersonDescriptionView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 22/04/2022.
//

import SwiftUI

struct PersonDescriptionView: View {

    // MARK: Properties

    static var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()

    let person: Person
    let credits: Person.Credits

    // MARK: View

    var body: some View {
        HStack {
            Text(String(format: "%.1f", average))
                .padding()
                .background(
                    Circle()
                        .stroke(.gray, lineWidth: 2)
                        .padding(6)
                )
                .frame(width: 60, height: 60)

            Spacer()

            VStack(alignment: .trailing) {
                Text(person.name)
                    .font(.title2)
                Group {
                    if let birthday = person.birthday {
                        Text(birthday, formatter: Self.dateFormatter)
                    }
                    if let bornLocation = person.bornLocation {
                        Text(bornLocation)
                    }
                }
                .font(.subheadline)
            }

        }
        .padding([.leading, .trailing])
    }

    private var average: Double { credits.casts.map(\.average).average }

}
