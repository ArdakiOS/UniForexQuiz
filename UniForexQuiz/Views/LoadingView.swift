//
//  LoadingView.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 07.02.2024.
//

import SwiftUI

struct LoadingView: View {
    @State var show = false
    @Binding var rot : Double
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            Image("Bg")
                .resizable()
                .ignoresSafeArea()
            Image("logo")
                .resizable()
                .frame(width: 100, height: 120)
            if show{
                VStack{
                    Spacer()
                    Image("loadicon")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(rot))
                        .padding(.bottom, 50)
                        .onReceive(timer, perform: { _ in
                            withAnimation(.easeIn){
                                rot += 10
                            }
                        })
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                withAnimation {
                    show = true
                }
            }
        }
    }
}
