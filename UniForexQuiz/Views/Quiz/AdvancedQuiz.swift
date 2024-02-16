//
//  AdvancedQuiz.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 10.02.2024.
//

import SwiftUI

struct AdvancedQuiz: View {
    @Binding var currentPage : QuizTypes
    @State var showQuiz = false
    @StateObject var vm = AdvancedQuizVM()
    var body: some View {
        if !showQuiz{
            VStack{
                HStack{
                    Text("Advanced Quiz")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    
                        .padding(.bottom)
                    Spacer()
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)){
                            currentPage = .none
                        }
                    } label: {
                        Text("Back")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 180/255, green: 180/255, blue: 197/255))
                    }
                }
                .frame(width: 343, alignment: .leading)
                
                Text("The Advanced test includes 4 levels of 5 questions, answer everything correctly, and you will be able to completely fill out the progress scale!")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .frame(width: 343, alignment: .leading)
                    .padding(.bottom)
                
                Text("Your progress")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .frame(width: 343, alignment: .leading)
                ZStack(alignment:.leading){
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("QuizRow"))
                        .frame(width: 343, height: 24)
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("AdvRow"))
                        .frame(width: CGFloat(343 * vm.progress / (vm.quizArray.count - 1)), height: 24)
                }
                
                Spacer()
                
                Button{
                    withAnimation(.easeInOut(duration: 0.3)){
                        showQuiz = true
                    }
                } label: {
                    Text("Lvl \(vm.currentLvl) Start")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .frame(width: 343, height: 53)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.init(red: 41/255, green: 131/255, blue: 237/255))
                        }
                }
                .padding(.bottom)
            }
            .onAppear{
                vm.getCurrentQuestionIndex()
            }
            .foregroundColor(.white)
        }
        else{
            AdvancedQuestionPage(vm: vm, showQuiz: $showQuiz)
        }
        
    }
}
