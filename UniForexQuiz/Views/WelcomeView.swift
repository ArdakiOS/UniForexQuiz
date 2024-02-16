//
//  ContentView.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 07.02.2024.
//

import SwiftUI

struct WelcomeView: View {
    @State var rot = 0.0
    var body: some View {
        ZStack{
            NavView()
            if rot < 500{
                LoadingView(rot: $rot)
            }
        }
    }
}

#Preview {
    WelcomeView()
}
