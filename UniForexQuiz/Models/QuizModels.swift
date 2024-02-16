//
//  BasicQuizModel.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 14.02.2024.
//

import Foundation

struct QuizModel : Codable, Hashable {
    let question : String
    let image : String?
    let answers : Set<String>
    let correctAnswer : String
    let lvl : String
}

struct GlossQuizModel : Codable, Hashable {
    let question : String
    let answers : Set<String>
    let correctAnswer : String
}
