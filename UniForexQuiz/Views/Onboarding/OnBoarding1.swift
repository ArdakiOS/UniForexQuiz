//
//  OnBoarding1.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 07.02.2024.
//

import SwiftUI
import AppTrackingTransparency

struct OnBoarding1: View {
    @Binding var currentPage : myTabs
    var body: some View {
        ZStack{
            Image("Bg")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 0){
                Text("Welcome!")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .frame(width: 343, alignment: .center)
                    .padding(.bottom, 20)
                
                Image("onb1")
                    .resizable()
                    .frame(width: 300, height: 450)
                    .padding(.vertical, 20)
                
                Text("Let's introduce you \nto the functionality,you will like it!")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .frame(width: 343)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                
                Spacer()
                
                Button(action: {
                    ATTrackingManager.requestTrackingAuthorization { status in
                        switch status {
                        case .notDetermined:
                            print("ND")
                        case .restricted:
                            print("Restricted")
                        case .denied:
                            print("Denied")
                        case .authorized:
                            print("Authorized")
                        @unknown default:
                            print("Unknown")
                        }
                        
                        currentPage = .two
                    }
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
                .padding(.bottom, 40)
                
            }
            .foregroundColor(.white)
        }
        
    }
}

