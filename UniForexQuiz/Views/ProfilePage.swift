//
//  ProfilePage.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 10.02.2024.
//

import SwiftUI

struct ProfilePage: View {
    @StateObject var vm = AchievmentsVM()
    @State var name = UserDefaults.standard.string(forKey: "profileName") ?? "Your name"
    @State var enterName = false
    
    @State private var image: UIImage?
    
    @State var selectImage = false
    var body: some View {
        VStack{
            Text("Profile")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .frame(width: 343, alignment: .leading)
            
            HStack{
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 98, height: 98)
                        .clipShape(Circle())
                }
                else{
                    Image("ProfilePic")
                        .resizable()
                        .frame(width: 98, height: 98)
                }
                VStack{
                    
                    if !enterName{
                        Text("\(name)")
                            .frame(width: 221,height: 45)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("QuizRow"))
                            )
                            .onTapGesture {
                                enterName = true
                            }
                    }
                    else{
                        TextField("Your name", text: $name)
                            .padding(.horizontal)
                            .frame(width: 221,height: 45)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("QuizRow"))
                            )
                    }
                    
                    
                    
                    Text("Swap icon")
                        .frame(width: 221,height: 45)
                        .onTapGesture {
                            selectImage = true
                        }
                }
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .frame(width: 221, height: 98)
            }
            .frame(width: 343)
            
            HStack{
                Button {
                    //
                } label: {
                    Text("Privacy Policy")
                        .frame(width: 163, height: 45)
                        .background(
                            RoundedRectangle(cornerRadius: 8).stroke(Color("NoAns"))
                        )
                }
                
                Button {
                    //
                } label: {
                    Text("Support")
                        .frame(width: 163, height: 45)
                        .background(
                            RoundedRectangle(cornerRadius: 8).stroke(Color("NoAns"))
                        )
                }
                
            }
            .font(.system(size: 16))
            .fontWeight(.bold)
            .frame(width: 343)
            .padding(.bottom)
            
            VStack{
                HStack{
                    Text("Achievments")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .frame(width: 255, alignment: .leading)
                    
                    Text("\(vm.number)/\(vm.achievments.count)")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .padding(.leading)
                }
                .padding(.top)
                ScrollView(.vertical) {
                    ForEach(vm.achievments, id: \.self) { row in
                        HStack{
                            Text(row.name)
                                .font(.system(size: 16))
                            
                            Spacer()
                            if row.status {
                                Image("prof")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            else{
                                Text("in progress")
                                    .font(.system(size: 12))
                                    .padding(5)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8).stroke(Color("ActiveTab"))
                                    )
                            }
                        }
                        .padding(.horizontal)
                        .frame(minWidth: 311, minHeight: 48, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("NoAns"))
                        )
                    }
                }
                .frame(width: 255)
            }
            .frame(width: 343)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("QuizRow"))
            )
        }
        .onChange(of: name, { oldValue, newValue in
            UserDefaults.standard.setValue(newValue, forKey: "profileName")
        })
        .onAppear{
            vm.update()
            if let imageUrlString = UserDefaults.standard.string(forKey: "imageUrl"),
               let imageUrl = URL(string: imageUrlString),
               let imageData = try? Data(contentsOf: imageUrl) {
                self.image = UIImage(data: imageData)
            }
        }
        .sheet(isPresented: $selectImage, content: {
            ImagePicker(image: self.$image)
        })
        .foregroundColor(.white)
    }
}

#Preview {
    NavView(currentPage: .profile)
}
