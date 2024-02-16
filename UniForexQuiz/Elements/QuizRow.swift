//
//  QuizRow.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 10.02.2024.
//

import SwiftUI

enum QuizTypes : String, CaseIterable {
    case basic = "Basic"
    case adv = "Advanced"
    case glos = "Glossary"
    case none = ""
}

struct QuizRow: View {
    @State var type = QuizTypes.basic
    @Binding var selectedQuiz : QuizTypes
    var body: some View {
        switch type {
        case .basic:
            Button {
                withAnimation(.easeInOut(duration: 0.3)){
                    selectedQuiz = .basic
                }
            } label: {
                HStack{
                    Text("Basic")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .frame(width: 269, alignment: .leading)
                    Image("Basic")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .frame(width: 343, height: 56)
                .background(
                    HStack(spacing: 0){
                        Rectangle().fill(Color("BasicRow"))
                            .frame(width: 12)
                        Rectangle().fill(Color("QuizRow"))
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        case .adv:
            Button {
                withAnimation(.easeInOut(duration: 0.3)){
                    selectedQuiz = .adv
                }
            } label: {
                HStack{
                    Text("Advanced")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .frame(width: 269, alignment: .leading)
                    Image("Advanced")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .frame(width: 343, height: 56)
                .background(
                    HStack(spacing: 0){
                        Rectangle().fill(Color("AdvRow"))
                            .frame(width: 12)
                        Rectangle().fill(Color("QuizRow"))
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            
        case .glos:
            Button {
                withAnimation(.easeInOut(duration: 0.3)){
                    selectedQuiz = .glos
                }
            } label: {
                HStack{
                    Text("Glossary")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .frame(width: 269, alignment: .leading)
                    Image("Glossary")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .frame(width: 343, height: 56)
                .background(
                    HStack(spacing: 0){
                        Rectangle().fill(Color("GloRow"))
                            .frame(width: 12)
                        Rectangle().fill(Color("QuizRow"))
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        case .none :
            HStack{}
        }
    }
}

#Preview {
    NavView(currentPage: .quiz)
}
