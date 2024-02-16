//
//  ProgressTriangle.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 10.02.2024.
//

import SwiftUI

struct Triangle: Shape {
    let midX : Double = 156
    let midY : Double = 115
    let maxX : Double = 312
    let maxY : Double = 236
    let minX : Double = 0
    let minY : Double = 0
    
    let basicPrg : Double
    let advPrg : Double
    let gloPrg : Double
    
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY + 30 - (147 * advPrg)))
        path.addLine(to: CGPoint(x: rect.midX - (135 * basicPrg), y: rect.midY + 30 + (87 * basicPrg)))
        path.addLine(to: CGPoint(x: rect.midX + (135 * gloPrg) , y: rect.midY + 30 + (87 * gloPrg)))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY + 30 - (147 * advPrg)))
        
        return path
        
    }
}

#Preview {
    NavView(currentPage: .progress)
}
