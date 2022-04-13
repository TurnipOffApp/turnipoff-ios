//
//  MovieDescriptionView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import SwiftUI

struct MovieDescriptionView: View {

    let movie: Movie

    #warning("make these static")
    let dateFormatter: DateFormatter
    let dateComponentsFormatter: DateComponentsFormatter

    init(movie: Movie) {
        self.movie = movie
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        self.dateFormatter = dateFormatter
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.unitsStyle = .brief
        dateComponentsFormatter.allowedUnits = [.hour, .minute]
        dateComponentsFormatter.zeroFormattingBehavior = [.pad]
        self.dateComponentsFormatter = dateComponentsFormatter
    }

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

            #warning("clean this part")
            VStack(alignment: .trailing) {
                Text(movie.title)
                    .font(.title2)
                Text(movie.genres.map(\.name).joined(separator: ","))
                    .font(.subheadline)
                HStack {
                    Text(movie.release, formatter: dateFormatter)
                    let measurement: Measurement<UnitDuration> = .init(value: Double(movie.runtime), unit: .minutes)
                    let seconds = measurement.converted(to: .seconds).value
                    if let formatted = dateComponentsFormatter.string(from: seconds) {
                        Text(formatted)
                    }
                }
            }

        }
        .padding()
    }

}

