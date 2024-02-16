//
//  Glossary.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 10.02.2024.
//

import SwiftUI

struct Glossary: View {
    @Binding var currentPage : QuizTypes
    @State var showQuiz = false
    @StateObject var vm = GlossQuizVM()
    var body: some View {
        if !showQuiz{
            VStack{
                HStack{
                    Text("Glossary Quiz")
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
                
                Text("Glossary quiz is the most extensive course, here progress is considered not by levels, but by the words learned. You can also view all the terms you have learned again, which will help consolidate the material you have learned!")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .frame(width: 343, alignment: .leading)
                    .padding(.bottom)
                ZStack{
                    VStack{
                        HStack{
                            Text("Archive")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .frame(width: 255, alignment: .leading)
                            
                            Text("\(vm.progress)/\(vm.quizArray.count)")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .padding(.leading)
                        }
                        .padding(.top)
                        ScrollView(.vertical) {
                            ForEach(vm.quizArray.indices, id:\.self){row in
                                HStack{
                                    Text("\(row + 1)")
                                    
                                    Spacer()
                                    Text(vm.quizArray[row].correctAnswer)
                                        .frame(width: 279, height: 53)
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(row <= vm.progress ? Color("NoAns"): Color("MainBg"))
                                        )
                                }
                                .foregroundColor(row > vm.progress ? Color("InactiveTab") : Color.white)
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .frame(width: 311)
                            }
                        }
                    }
                    .frame(width: 343)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("QuizRow"))
                    )
                    
                    Button{
                        showQuiz = true
                    } label: {
                        Text("Start")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .frame(width: 343, height: 53)
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.init(red: 41/255, green: 131/255, blue: 237/255))
                            }
                            
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom)
                }
            }
            .onAppear{
                vm.getCurrentQuestionIndex()
            }
            .foregroundColor(.white)
        }
        else{
            GlossQuestionPage(vm: vm, showQuiz: $showQuiz)
        }
    }
}
