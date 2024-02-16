//
//  AchievmentsVM.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 15.02.2024.
//

import Foundation

class AchievmentsVM : ObservableObject {
    @Published var achievments : [AchievmentsModel] = []
    @Published var number = UserDefaults.standard.integer(forKey: "achNum")
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "achievments"),
           let decoded = try? JSONDecoder().decode([AchievmentsModel].self, from: data) {
            self.achievments = decoded
        }
        else {
            self.achievments = [
                AchievmentsModel(name: "Pass the first level in the basic and advanced quiz", status: false),
                AchievmentsModel(name: "Complete the basic quiz", status: false),
                AchievmentsModel(name: "Finish the advanced quiz", status: false),
                AchievmentsModel(name: "Learn 10 words", status: false),
                AchievmentsModel(name: "Learn 30 words", status: false),
                AchievmentsModel(name: "Learn 50 words", status: false),
                AchievmentsModel(name: "Finish the glossary quiz", status: false),
                AchievmentsModel(name: "Make a mistake 5 times", status: false),
                AchievmentsModel(name: "Completely upgrade one of the branches in progress", status: false),
                AchievmentsModel(name: "Upgrade all branches in progress", status: false),
                AchievmentsModel(name: "Quit the quiz without finishing it", status: false),
                AchievmentsModel(name: "Answer only one question correctly", status: false),
                AchievmentsModel(name: "Spend 5 minutes on the quiz", status: false),
                AchievmentsModel(name: "Get all achievements", status: false)
            ]
        }
        update()
        
    }
    
    
    func update() {
        if Int(UserDefaults.standard.string(forKey: "currentLvl") ?? "1" )! > 1 && Int(UserDefaults.standard.string(forKey: "currentAdvLvl") ?? "1")! > 1 {
            changeAchievmentStatus(name: "Pass the first level in the basic and advanced quiz")
            
        }
        if UserDefaults.standard.bool(forKey: "completeBasic"){
            changeAchievmentStatus(name: "Complete the basic quiz")
            changeAchievmentStatus(name: "Completely upgrade one of the branches in progress")
            
        }
        
        if UserDefaults.standard.bool(forKey: "completeAdv"){
            changeAchievmentStatus(name: "Finish the advanced quiz")
            changeAchievmentStatus(name: "Completely upgrade one of the branches in progress")
            
        }
        
        if Int(UserDefaults.standard.string(forKey: "currentGloQuestionIndex") ?? "0")! >= 10 {
            changeAchievmentStatus(name: "Learn 10 words")
            
        }
        
        if Int(UserDefaults.standard.string(forKey: "currentGloQuestionIndex") ?? "0")! >= 30 {
            changeAchievmentStatus(name: "Learn 30 words")
            
        }
        if Int(UserDefaults.standard.string(forKey: "currentGloQuestionIndex") ?? "0")! >= 50 {
            changeAchievmentStatus(name: "Learn 50 words")
            
        }
        
        if UserDefaults.standard.bool(forKey: "completeGlo"){
            changeAchievmentStatus(name: "Finish the glossary quiz")
            changeAchievmentStatus(name: "Completely upgrade one of the branches in progress")
            
        }
        
        if UserDefaults.standard.integer(forKey: "wrongCnt") >= 5 {
            changeAchievmentStatus(name: "Make a mistake 5 times")
            
        }
        
        if UserDefaults.standard.bool(forKey: "completeBasic") && UserDefaults.standard.bool(forKey: "completeAdv") && UserDefaults.standard.bool(forKey: "completeGlo"){
            changeAchievmentStatus(name: "Upgrade all branches in progress")
        }
        
        if UserDefaults.standard.bool(forKey: "leaveEarly") {
            changeAchievmentStatus(name: "Quit the quiz without finishing it")
            changeAchievmentStatus(name: "Answer only one question correctly")
        }
        
        if UserDefaults.standard.bool(forKey: "5min"){
            changeAchievmentStatus(name: "Spend 5 minutes on the quiz")
        }
        
        if number == achievments.count {
            changeAchievmentStatus(name: "Get all achievements")
        }
        
        
        if let encoded = try? JSONEncoder().encode(achievments) {
            UserDefaults.standard.set(encoded, forKey: "achievments")
        }
        
        count()
        
        
    }
    func changeAchievmentStatus(name : String) {
        if let index = achievments.firstIndex(where: { $0.name == name }) {
            achievments[index].status = true
            
        } else {
            print("Achievement not found")
        }
    }
    
    func count() {
        var temp = 0
        for i in achievments {
            if i.status == true{
                temp += 1
            }
        }
        number = temp
        UserDefaults.standard.setValue(temp, forKey: "achNum")
    }
    
}
