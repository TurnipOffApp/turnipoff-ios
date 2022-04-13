//
//  HomeView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 12/04/2022.
//

import SwiftUI

struct HomeView: View {

    @StateObject var viewModel = TestViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            TrendingView()
            Spacer()
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
