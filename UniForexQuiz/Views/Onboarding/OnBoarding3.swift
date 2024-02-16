//
//  OnBoarding3.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 07.02.2024.
//

import SwiftUI

struct OnBoarding3: View {
    @Binding var currentPage : myTabs
    var body: some View {
        ZStack{
            Image("Bg")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 0){
                Text("Quizzes")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .frame(width: 343, alignment: .center)
                    .padding(.bottom, 20)
                Spacer()
                Image("onb3")
                    .resizable()
                    .frame(width: 343, height: 192)
                    .padding(.vertical, 20)
                Spacer()
                Text("3 courses of quizzes for beginners")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .frame(width: 343)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                
                
                Button(action: {
                    currentPage = .four
                }, label: {
                    Text("Continue")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .frame(maxWidth: 343, maxHeight: 53)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.init(red: 41/255, green: 131/255, blue: 237/255))
                        }
                })
                .padding(.top, 20)
                .padding(.bottom, 40)
                
            }
            .foregroundColor(.white)
        }
        
    }
}

