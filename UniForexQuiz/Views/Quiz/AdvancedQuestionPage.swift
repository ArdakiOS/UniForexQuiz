//
//  AdvancedQuestionPage.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 15.02.2024.
//

import SwiftUI

struct AdvancedQuestionPage: View {
    @ObservedObject var vm : AdvancedQuizVM
    @State var color1 : [Color] = [Color("NoAns"),Color("NoAns"),Color("NoAns"),Color("NoAns"),Color("NoAns")]
    
    @State private var selectedAnswer: String?
    @State private var revealCorrectAnswer = false
    @State var line = 0
    @State var present = false
    
    @Binding var showQuiz : Bool
    let timer = Timer.publish(every: 300, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Advanced Quiz Lvl \(vm.quizArray[vm.idx].lvl)")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        vm.saveCurrentQuestionIndex(vm.idx, lvl: vm.quizArray[vm.idx].lvl)
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
                
                HStack(){
                    QuizLine(color: $color1)
                }
                .frame(width: 343)
                .padding(.bottom)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("QuizRow"))
                    VStack{
                        Text("\(vm.quizArray[vm.idx].question)")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .frame(width: 295)
                        
                        if vm.quizArray[vm.idx].image != nil {
                            Image(vm.quizArray[vm.idx].image!)
                                .resizable()
                                .frame(width: 316, height: 156)
                        }
                    }
                }
                .frame(maxWidth: 343, maxHeight: 282)
                .padding(.bottom, 25)
                
                
                
                VStack {
                    ForEach(Array(vm.quizArray[vm.idx].answers), id: \.self) { row in
                        Button {
                            selectedAnswer = row
                            revealCorrectAnswer = true
                            
                            
                            var incorrectAns = UserDefaults.standard.integer(forKey: "wrongCnt")
                            if selectedAnswer != vm.quizArray[vm.idx].correctAnswer{
                                incorrectAns += 1
                                UserDefaults.standard.setValue(incorrectAns, forKey: "wrongCnt")
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                
                                
                                if row == vm.quizArray[vm.idx].correctAnswer{
                                    color1[line] = Color("CorrectAns")
                                }
                                else{
                                    color1[line] = Color("WrongAns")
                                }
                                
                                
                                
                                if vm.idx + 1 == vm.quizArray.count{
                                    vm.saveCurrentQuestionIndex(vm.idx, lvl: vm.quizArray[vm.idx].lvl)
                                    showQuiz = false
                                    UserDefaults.standard.setValue(true, forKey: "completeAdv")
                                }
                                else{
                                    line += 1
                                    vm.idx += 1
                                    revealCorrectAnswer = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                        if line == 5 {
                                            line = 0
                                            color1 = [Color("NoAns"),Color("NoAns"),Color("NoAns"),Color("NoAns"),Color("NoAns")]
                                        }
                                    }
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
                                        if revealCorrectAnswer && row == vm.quizArray[vm.idx].correctAnswer {
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

