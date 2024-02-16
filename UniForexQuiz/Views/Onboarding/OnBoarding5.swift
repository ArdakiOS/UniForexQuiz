//
//  OnBoarding5.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 07.02.2024.
//

import SwiftUI

struct OnBoarding5: View {
        @Binding var show : Bool
    var body: some View {
        ZStack{
            Image("Bg")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 0){
                Text("A great opportunity")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .frame(width: 343, alignment: .center)
                    .padding(.bottom, 10)
                Spacer()
                Image("onb5")
                    .resizable()
                    .frame(width: 343, height: 310)
                    .padding(.vertical, 20)
                Spacer()
                Text("Get your unique experience now")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .frame(width: 343)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)

                Button(action: {
                    withAnimation(.easeInOut){
                        show = false
                    }
                    UserDefaults.standard.setValue(show, forKey: "showOnb")
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
