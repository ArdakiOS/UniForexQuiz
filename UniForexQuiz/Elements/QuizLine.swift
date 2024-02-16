//
//  QuizLine.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 14.02.2024.
//

import SwiftUI

struct QuizLine: View {
    @Binding var color : [Color]
    var body: some View {
        HStack{
            ForEach(color, id: \.self){line in
                RoundedRectangle(cornerRadius: 8)
                    .fill(line)
                    .frame(width: 62, height: 8)
            }
        }
    }
}
