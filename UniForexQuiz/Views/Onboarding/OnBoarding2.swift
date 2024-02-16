//
//  OnBoarding2.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 07.02.2024.
//

import SwiftUI
import UserNotifications

struct OnBoarding2: View {
    @Binding var currentPage : myTabs
    var body: some View {
        ZStack{
            Image("Bg")
                .resizable()
                .ignoresSafeArea()
            Image("onb2")
                .resizable()
                .frame(maxHeight: .infinity)
                .offset(y: 50)
            VStack(spacing: 0){
                Text("Don't miss out on new update")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.horizontal, 7)
                    .multilineTextAlignment(.center)
                    .frame(width: 343, alignment: .center)
                    .padding(.bottom, 20)
                Spacer()
                
                Button(action: {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                        if granted{
                            //
                        }
                        else{
                            print("Not Granted Notif")
                        }
                        currentPage = .three
                    }
                }, label: {
                    Text("Show")
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

