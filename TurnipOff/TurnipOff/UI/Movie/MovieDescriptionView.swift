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
    static var listFormatter: ListFormatter = {
        let listFormatter = ListFormatter()
        return listFormatter
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
                .padding()
                .background(
                    Circle()
                        .stroke(.gray, lineWidth: 2)
                        .padding(6)
                )
                .frame(width: 60, height: 60)

            Spacer()

            VStack(alignment: .trailing) {
                Text(movie.title)
                    .font(.title2)
                HStack {
                    Text(movie.genres.map(\.name), format: .list(type: .and))
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

        }
        .padding([.leading, .trailing])
    }

}
