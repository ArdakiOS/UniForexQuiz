//
//  QuizPage.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 10.02.2024.
//

import SwiftUI

struct QuizPage: View {
    @State var quizPage = QuizTypes.none
    var body: some View {
        switch quizPage {
        case .basic:
            BasicQuiz(currentPage: $quizPage)
        case .adv:
            AdvancedQuiz(currentPage: $quizPage)
        case .glos:
            Glossary(currentPage: $quizPage)
        case .none:
            VStack(){
               Text("Quiz")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .frame(width: 343, alignment: .leading)
                    .padding(.bottom)
                VStack{
                    Text("Welcome")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Text("We invite you to learn the basics of the forex market and binary options using our application. Choose any of the courses to start the test and improve your knowledge, good luck!")
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                    Button {
                        UserDefaults.standard.set(0, forKey: "currentQuestionIndex")
                        UserDefaults.standard.set("1", forKey: "currentLvl")
                        UserDefaults.standard.set(0, forKey: "currentAdvQuestionIndex")
                        UserDefaults.standard.set("1", forKey: "currentAdvLvl")
                        UserDefaults.standard.set(0, forKey: "currentGloQuestionIndex")
                    } label: {
                        Text("reset")
                    }

                }
                .frame(width: 343)
                Spacer()
                VStack(spacing: 15){
                    QuizRow(type: .basic, selectedQuiz: $quizPage)
                    QuizRow(type: .adv, selectedQuiz: $quizPage)
                    QuizRow(type: .glos, selectedQuiz: $quizPage)
                }
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    NavView(currentPage: .quiz)
}
