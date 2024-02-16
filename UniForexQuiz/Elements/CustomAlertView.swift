//
//  CustomAlertView.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 15.02.2024.
//

import SwiftUI

struct CustomAlertView: View {

    var actionStay: () -> Void
    var actionQuit: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.6).edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Text("You really want to out?")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                HStack{
                    Button (action : actionQuit){
                        Text("Yes")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .frame(width: 147, height: 45)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("NoAns"))
                            )
                    }
                    
                    Button (action: actionStay) {
                        Text("Stay")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .frame(width: 147, height: 45)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("ActiveTab"))
                            )
                    }

                }
            }
            .frame(width: 343, height: 155)
            .background(Color("QuizRow"))
            .cornerRadius(8)
            .foregroundColor(.white)
        }
    }
}
