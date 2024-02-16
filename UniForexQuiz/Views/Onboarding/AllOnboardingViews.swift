//
//  AllOnboardingViews.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 07.02.2024.
//

import SwiftUI

enum myTabs : CaseIterable {
    case one
    case two
    case three
    case four
    case five

}

struct AllOnboardingViews: View {
    @State var currentTab : myTabs = .one
    @Binding var showOnboarding : Bool
    var body: some View {
        ZStack{
            Color.init(red: 30/255, green: 33/255, blue: 41/255).ignoresSafeArea()
            switch currentTab {
            case .one:
                OnBoarding1(currentPage: $currentTab)
                    .transition(.move(edge: .trailing))
            case .two:
                OnBoarding2(currentPage: $currentTab)
                    .transition(.move(edge: .trailing))
            case .three:
                OnBoarding3(currentPage: $currentTab)
                    .transition(.move(edge: .trailing))
            case .four:
                OnBoarding4(currentPage: $currentTab)
                    .transition(.move(edge: .trailing))
            case .five:
                OnBoarding5(show: $showOnboarding)
                    .transition(.move(edge: .trailing))
            }
        }
        .animation(.bouncy(duration: 0.7), value: currentTab)
    }
}

