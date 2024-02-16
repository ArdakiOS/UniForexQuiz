//
//  NavView.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 07.02.2024.
//

import SwiftUI

enum NavTabs : String, CaseIterable {
    case progress = "Progress"
    case quiz = "Quiz"
    case profile = "Profile"
}

struct NavView: View {
    @State var showOnboarding = UserDefaults.standard.object(forKey: "showOnb")as? Bool ?? true
    @State var currentPage = NavTabs.progress
    var body: some View {
        if showOnboarding{
            AllOnboardingViews(showOnboarding: $showOnboarding)
        }
        else{
            ZStack{
                Color("MainBg").ignoresSafeArea()
                VStack{
                    switch currentPage {
                    case .progress:
                        ProgressPage()
                    case .quiz:
                        QuizPage()
                    case .profile:
                        ProfilePage()
                    }
                    Spacer()
                    NavTabBar(selectedTab: $currentPage)
                }
            }
        }
    }
}

#Preview {
    NavView()
}
