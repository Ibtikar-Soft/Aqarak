//
//  AppInto.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI

struct AppInto: View {
    @State private var currentTab = 0
    var body: some View {
        TabView(selection: $currentTab,
                content:  {
                    OnboardingViewOne()
                        .tag(0)
                    OnboardingViewTwo()
                        .tag(1)
                    OnboardingViewThree()
                        .tag(3)
                })
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}


struct AppInto_Previews: PreviewProvider {
    static var previews: some View {
        AppInto()
    }
}
