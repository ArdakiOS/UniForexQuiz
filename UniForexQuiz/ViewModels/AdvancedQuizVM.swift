//
//  AdvancedQuizVM.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 15.02.2024.
//

import Foundation

class AdvancedQuizVM : ObservableObject {
    
    let quizArray: [QuizModel] = [
        QuizModel(
            question: "Money is recommended:",
            image: nil,
            answers: ["to save for a 'rainy day'", "immediately spend", "to lend at interest", "invest to generate income"],
            correctAnswer: "invest to generate income",
            lvl: "1"
        ),
        QuizModel(
            question: "The optimal amount of money saved:",
            image: nil,
            answers: ["10%-40% of monthly income", "50% of monthly income", "maximum savings", "more than 50% of monthly income"],
            correctAnswer: "10%-40% of monthly income",
            lvl: "1"
        ),
        QuizModel(
            question: "The concept of 'risky currencies' means:",
            image: nil,
            answers: ["currencies of the exporting countries of raw materials", "currencies of developing countries", "currencies whose issue does not meet international standards", "currencies whose banknotes do not have the maximum degree of protection"],
            correctAnswer: "currencies of the exporting countries of raw materials",
            lvl: "1"
        ),
        QuizModel(
            question: "What is the main task of assigning the Stoploss level?",
            image: nil,
            answers: ["to get additional profit", "limit risks", "open a deal", "all three options are correct"],
            correctAnswer: "limit risks",
            lvl: "1"
        ),
        QuizModel(
            question: "Before making a deal, you need to know:",
            image: nil,
            answers: ["the price at which you need to close the deal when making a profit", "the price at which it is necessary to close the transaction when receiving losses", "maximum working time of the transaction", "all the answers are correct"],
            correctAnswer: "all the answers are correct",
            lvl: "1"
        ),
        QuizModel(
            question: "Market participants who are interested in lowering the value of the currency of the currency are called:",
            image: nil,
            answers: ["owls", "bears", "hares", "bulls"],
            correctAnswer: "bears",
            lvl: "2"
        ),
        QuizModel(
            question: "The protective currency is:",
            image: nil,
            answers: ["a currency that has comprehensive protection against counterfeiting", "currency backed by gold", "a currency that strengthens during periods of anxiety and uncertainty in the market", "the currency held on a bank deposit"],
            correctAnswer: "a currency that strengthens during periods of anxiety and uncertainty in the market",
            lvl: "2"
        ),
        QuizModel(
            question: "The amount of investment in the Lamm account:",
            image: nil,
            answers: ["depends on the terms of the offer", "can be any", "at least $1,000", "no more than $5,000"],
            correctAnswer: "depends on the terms of the offer",
            lvl: "2"
        ),
        QuizModel(
            question: "The income of a broker working under the agency model is:",
            image: nil,
            answers: ["the loss of the client", "percentage of the client's profit", "spread and swap", "all of the above"],
            correctAnswer: "spread and swap",
            lvl: "2"
        ),
        QuizModel(
            question: "The strongest fundamental factor in the Forex market is considered to be:",
            image: nil,
            answers: ["macroeconomic statistics", "monetary policy of the world's central banks", "statements of political figures", "all factors are equivalent"],
            correctAnswer: "monetary policy of the world's central banks",
            lvl: "2"
        ),
        QuizModel(
            question: "The divergence of monetary policies is called:",
            image: nil,
            answers: ["escalation", "differential", "convergence", "divergence"],
            correctAnswer: "divergence",
            lvl: "3"
        ),
        QuizModel(
            question: "When hedging, a reverse position is opened to",
            image: nil,
            answers: ["get a buy signal", "get a sell signal", "protect the main transaction", "fix the main transaction"],
            correctAnswer: "protect the main transaction",
            lvl: "3"
        ),
        QuizModel(
            question: "Which sessions are the most aggressive?",
            image: nil,
            answers: ["American and Asian", "American and European", "Asian and European", "Australian and Japanese"],
            correctAnswer: "American and European",
            lvl: "3"
        ),
        QuizModel(
            question: "What is the main task of the Takeprofit level post-promotion?",
            image: nil,
            answers: ["to get additional profit", "limit risks", "close the deal", "all three options are correct"],
            correctAnswer: "close the deal",
            lvl: "3"
        ),
        QuizModel(
            question: "What does not apply to the main postulates of technical analysis?",
            image: nil,
            answers: ["prices depend on supply and demand", "history repeats itself", "asset price movements take into account all factors", "prices move in a directional way"],
            correctAnswer: "prices move in a directional way",
            lvl: "3"
        ),
        QuizModel(
            question: "What are the tools of mathematical analysis of the Forex market called?",
            image: nil,
            answers: ["technical indicators", "fundamental indicators", "forecast values", "mixed values"],
            correctAnswer: "technical indicators",
            lvl: "4"
        ),
        QuizModel(
            question: "What is the main principle of the Forex market?",
            image: nil,
            answers: ["stock exchange", "currency sale", "exchange of one currency for another", "all the answers are correct"],
            correctAnswer: "exchange of one currency for another",
            lvl: "4"
        ),
        QuizModel(
            question: "The price offered by the market maker for the purchase is called:",
            image: nil,
            answers: ["Bid", "Ask", "lot", "shoulder"],
            correctAnswer: "Bid",
            lvl: "4"
        ),
        QuizModel(
            question: "Which regional market is not part of Forex?",
            image: nil,
            answers: ["European", "American", "Australian", "Japanese"],
            correctAnswer: "Japanese",
            lvl: "4"
        ),
        QuizModel(
            question: "What is the name of a standard contract in the Forex market?",
            image: nil,
            answers: ["pot", "notes", "shoulder", "lot"],
            correctAnswer: "lot",
            lvl: "4"
        )
    ]

    
    @Published var idx = 0
    @Published var progress = 0
    @Published var currentLvl = "1"

    func saveCurrentQuestionIndex(_ index: Int, lvl : String) {
        UserDefaults.standard.set(index, forKey: "currentAdvQuestionIndex")
        UserDefaults.standard.set(lvl, forKey: "currentAdvLvl")
    }
    
    func getCurrentQuestionIndex() {
        let lvl = UserDefaults.standard.string(forKey: "currentAdvLvl") ?? "1"
        idx = quizArray.firstIndex(where: { $0.lvl == lvl })!
        progress = UserDefaults.standard.integer(forKey: "currentAdvQuestionIndex")
        currentLvl = lvl
    }
}
