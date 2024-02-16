//
//  GlossQuestionPage.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 15.02.2024.
//

import SwiftUI

struct GlossQuestionPage: View {
    @ObservedObject var vm : GlossQuizVM
    @State private var selectedAnswer: String?
    @State private var revealCorrectAnswer = false
    @State var present = false
    
    @Binding var showQuiz : Bool
    let timer = Timer.publish(every: 300, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Glossary Quiz")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        vm.saveCurrentQuestionIndex(vm.progress)
                        present = true
                    } label: {
                        Text("Back")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 180/255, green: 180/255, blue: 197/255))
                    }
                }
                .frame(width: 343)
                .padding(.bottom)
                
                Text("Which word does the description below refer to?")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("InactiveTab"))
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .frame(width: 343)
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("QuizRow"))
                    Text("\(vm.quizArray[vm.progress].question)")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .frame(width: 295)
                    
                }
                .frame(maxWidth: 343, maxHeight: 200)
                .padding(.bottom, 25)
                
                Spacer()
                
                VStack {
                    ForEach(Array(vm.quizArray[vm.progress].answers), id: \.self) { row in
                        Button {
                            selectedAnswer = row
                            revealCorrectAnswer = true
                            
                            
                            var incorrectAns = UserDefaults.standard.integer(forKey: "wrongCnt")
                            if selectedAnswer != vm.quizArray[vm.progress].correctAnswer{
                                incorrectAns += 1
                                UserDefaults.standard.setValue(incorrectAns, forKey: "wrongCnt")
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                
                                if vm.progress + 1 == vm.quizArray.count{
                                    vm.saveCurrentQuestionIndex(vm.progress)
                                    showQuiz = false
                                    UserDefaults.standard.setValue(true, forKey: "completeGlo")
                                }
                                else{
                                    vm.progress += 1
                                    revealCorrectAnswer = false
                                }
                            }
                        } label: {
                            Text("\(row)")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .frame(width: 343, height: 53)
                                .background(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(selectedAnswer == row ? Color("WrongAns") : Color("NoAns"))
                                        if revealCorrectAnswer && row == vm.quizArray[vm.progress].correctAnswer {
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(Color("CorrectAns"))
                                        }
                                    }
                                )
                                .foregroundColor(.white)
                                .padding(.bottom, 7)
                        }
                    }
                }
                
                .padding(.bottom)
            }
            .foregroundColor(.white)
            if present {
                CustomAlertView {
                    present = false
                } actionQuit: {
                    withAnimation(.easeInOut(duration: 0.3)){
                        showQuiz = false
                        UserDefaults.standard.setValue(true, forKey: "leaveEarly")
                    }
                }
                
            }
        }
        .onReceive(timer, perform: { _ in
            UserDefaults.standard.setValue(true, forKey: "5min")
        })
        .onAppear{
            vm.getCurrentQuestionIndex()
        }
        
    }
}
