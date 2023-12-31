//
//  MovieDescriptionView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import SwiftUI

struct MovieDescriptionView: View {

    // MARK: Properties

    static var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }()
    static var dateComponentsFormatter: DateComponentsFormatter = {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.unitsStyle = .brief
        dateComponentsFormatter.allowedUnits = [.hour, .minute]
        dateComponentsFormatter.zeroFormattingBehavior = [.pad]
        return dateComponentsFormatter
    }()

    let movie: Movie

    // MARK: View

    var body: some View {
        HStack {
            Text(String(movie.note))
                .padding(15)
                .background(
                    Circle()
                        .stroke(.gray, lineWidth: 2)
                        .padding(6)
                )
                .font(.title2)

            Spacer()

            VStack(alignment: .trailing) {
                Text(movie.title)
                    .font(.title2)
                Group {
                    Text(ListFormatter.localizedString(byJoining: movie.genres.map(\.name)))
                    Text(movie.release, formatter: Self.dateFormatter)
                }
                .font(.subheadline)

                let measurement: Measurement<UnitDuration> = .init(
                    value: Double(movie.runtime),
                    unit: .minutes
                )
                let seconds = measurement.converted(to: .seconds).value
                let formatted = Self.dateComponentsFormatter.string(from: seconds)
                if let formatted = formatted {
                    Text(formatted)
                }
            }
            .multilineTextAlignment(.trailing)
            .lineLimit(1)
            .scaledToFit()
            .minimumScaleFactor(0.5)

        }
        .padding([.leading, .trailing])
    }

}
