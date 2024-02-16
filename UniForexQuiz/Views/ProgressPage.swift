//
//  ProgressPage.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 10.02.2024.
//

import SwiftUI

struct ProgressPage: View {
    @State var basicPrg : Double = Double(UserDefaults.standard.integer(forKey: "currentQuestionIndex")) / 15
    @State var advPrg : Double = Double(UserDefaults.standard.integer(forKey: "currentAdvQuestionIndex")) / 20
    @State var gloPrg :Double = Double(UserDefaults.standard.integer(forKey: "currentGloQuestionIndex")) / 75
    var body: some View {
        VStack{
            Text("Progress")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .frame(width: 343, alignment: .leading)
                .padding(.bottom)
            Text("In this window you will be able to track your progress along three main branches")
                .font(.system(size: 18))
                .fontWeight(.bold)
                .frame(width: 343, alignment: .leading)
            Spacer()
            VStack{
                Text("Advanced")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                ZStack{
                    Image("prg")
                        .resizable()
                    Triangle(basicPrg: basicPrg, advPrg: advPrg, gloPrg: gloPrg)
                        .fill(
                            RadialGradient(gradient: Gradient(colors: [Color(red: 64/255, green: 102/255, blue: 246/255), Color(red: 64/255, green: 102/255, blue: 246/255).opacity(0.24)]), center: .bottom, startRadius: 1, endRadius: 50)
                        ) // Change the color of the triangle
                        .overlay(
                            Circle().frame(width: 8, height: 8).offset(x: 0, y: 30 - (147 * advPrg)), // Dot at the first vertex
                            alignment: .center)
                        .overlay(
                            Circle().frame(width: 8, height: 8).offset(x: -135 * basicPrg, y: 30 + (87 * basicPrg)), // Dot at the second vertex
                            alignment: .center)
                        .overlay(
                            Circle().frame(width: 8, height: 8).offset(x: 135 * gloPrg, y: 30 + (87 * gloPrg)), // Dot at the third vertex
                            alignment: .center)
                        .foregroundColor(Color(red: 41/255, green: 131/255, blue: 237/255))
                    
                    Triangle(basicPrg: basicPrg, advPrg: advPrg, gloPrg: gloPrg).stroke(Color(red: 41/255, green: 131/255, blue: 237/255), lineWidth: 2)
                }
                .frame(width: 312, height: 236, alignment: .center)
                
                HStack{
                    Text("Basic")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    Spacer()
                    Text("Glossary")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                }
                .frame(width: 343)
            }
            
            Spacer()
        }
        .foregroundColor(.white)
    }
}

#Preview {
    NavView(currentPage: .progress)
}
