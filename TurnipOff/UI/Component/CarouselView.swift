//
//  CarouselView.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import SwiftUI

struct CarouselView: View {

    init<PageType: View>(
        pages: [PageType],
        indexDisplayMode: PageTabViewStyle.IndexDisplayMode = .always
    ) {
        self.pages = pages.map { AnyView($0) }
        self.indexDisplayMode = indexDisplayMode
        trySetupStyle()
    }

    private let pages: [AnyView]
    private let indexDisplayMode: PageTabViewStyle.IndexDisplayMode

    var body: some View {
        if pages.isEmpty {
            Text("No data")
        } else {
            TabView {
                ForEach(Array(pages.enumerated()), id: \.offset) {
                    $0.element
                        .tag($0.offset)
                        .padding(.bottom, 50)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: indexDisplayMode))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }

    func trySetupStyle() {
        #if os(iOS) || os(tvOS)
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = .systemGray
        appearance.currentPageIndicatorTintColor = .systemBackground.inverse()
        
        #endif
    }
}
