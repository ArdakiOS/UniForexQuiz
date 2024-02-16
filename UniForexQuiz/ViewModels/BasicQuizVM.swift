//
//  BasicQuizVM.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 14.02.2024.
//

import Foundation

class BasicQuizVM : ObservableObject {
    
    let quizArray: [QuizModel] = [
        QuizModel(
            question: "What is the name of REVERSAL pattern?",
            image: nil,
            answers: ["Double bottom", "Rectangle", "Wood", "None of these"],
            correctAnswer: "Double bottom",
            lvl: "1"
        ),
        QuizModel(
            question: "What is LIMIT order?",
            image: nil,
            answers: ["An order that needs to be filled today", "An order to buy or sell at a set price", "An order to buy a limited number of lots", "An order to limit the price to the market price"],
            correctAnswer: "An order to buy or sell at a set price",
            lvl: "1"
        ),
        QuizModel(
            question: "What does it mean if you have go long?",
            image: nil,
            answers: ["You have bought exceeding your margin.", "You have bought the base currency and expect it to move higher.", "You have made a profit on your open position.", "You have closed all of your position."],
            correctAnswer: "You have bought the base currency and expect it to move higher.",
            lvl: "1"
        ),
        QuizModel(
            question: "What is number one indicator?",
            image: nil,
            answers: ["Price itself", "Stochastic", "Bollinger bands", "Momentum"],
            correctAnswer: "Price itself",
            lvl: "1"
        ),
        QuizModel(
            question: "In the currency pair GBP/JYP which currency is base?",
            image: nil,
            answers: ["GBP", "Neither", "Both", "JPY"],
            correctAnswer: "GBP",
            lvl: "1"
        ),
        QuizModel(
            question: "What is PIP?",
            image: nil,
            answers: ["A movement in the price of 100 points", "A movement in the price that is less than 10 points", "The minimum movement of a currency price", "A one-cent movement in the price of USD."],
            correctAnswer: "The minimum movement of a currency price",
            lvl: "2"
        ),
        QuizModel(
            question: "What is the name of REVERSAL pattern?",
            image: nil,
            answers: ["Flag", "Head & Shoulders", "House", "None of these"],
            correctAnswer: "Head & Shoulders",
            lvl: "2"
        ),
        QuizModel(
            question: "What is market order?",
            image: nil,
            answers: ["An order that needs to be filled today", "An order to buy at the market price", "An order to buy and mark the orders", "An order to limit the order to certain markets"],
            correctAnswer: "An order to buy at the market price",
            lvl: "2"
        ),
        QuizModel(
            question: "What is STANDARD LOT size?",
            image: nil,
            answers: ["1 000 currency units", "10 000 currency units", "100 000 currency units", "Depends on currency"],
            correctAnswer: "100 000 currency units",
            lvl: "2"
        ),
        QuizModel(
            question: "What does the BID price mean?",
            image: nil,
            answers: ["The price you can sell the base currency", "The price you can buy the base currency", "The price you can buy the counter currency", "The price you can sell the counter currency"],
            correctAnswer: "The price you can sell the base currency",
            lvl: "2"
        ),
        QuizModel(
            question: "If your broker has 100x margin ratio, how much do you need in your account to have position $10000?",
            image: nil,
            answers: ["$10 000", "$100", "$1000", "$100 000"],
            correctAnswer: "$100",
            lvl: "3"
        ),
        QuizModel(
            question: "What is MINI LOT size?",
            image: nil,
            answers: ["1 000 currency units", "10 000 currency units", "100 000 currency units", "Depends on a currency"],
            correctAnswer: "10 000 currency units",
            lvl: "3"
        ),
        QuizModel(
            question: "What does it mean if you have a SHORT position?",
            image: nil,
            answers: ["You have bought the base currency and sold the counter currency.", "You have sold the base currency and bought the counter currency.", "You have made a loss on a position.", "You are expecting the base currency to move lower."],
            correctAnswer: "You have sold the base currency and bought the counter currency.",
            lvl: "3"
        ),
        QuizModel(
            question: "What is the name of this price pattern?",
            image: "BasicQuiz",
            answers: ["Diamant", "Head & Shoulders", "Double top", "Double bottom"],
            correctAnswer: "Double top",
            lvl: "3"
        ),
        QuizModel(
            question: "What is the name of REVERSAL pattern?",
            image: nil,
            answers: ["Delfin", "Triangle", "Tripple bottom", "None of these"],
            correctAnswer: "Tripple bottom",
            lvl: "3"
        )
    ]
    
    @Published var idx = 0
    @Published var progress = 0
    @Published var currentLvl = "1"

    func saveCurrentQuestionIndex(_ index: Int, lvl : String) {
        UserDefaults.standard.set(index, forKey: "currentQuestionIndex")
        UserDefaults.standard.set(lvl, forKey: "currentLvl")
    }
    
    func getCurrentQuestionIndex() {
        let lvl = UserDefaults.standard.string(forKey: "currentLvl") ?? "1"
        idx = quizArray.firstIndex(where: { $0.lvl == lvl })!
        progress = UserDefaults.standard.integer(forKey: "currentQuestionIndex")
        currentLvl = lvl
    }
}
