//
//  ContentView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 12/04/2022.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = TestViewModel()

    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
