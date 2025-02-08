//
//  SwiftUIView.swift
//  DSM
//
//  Created by Manikandan on 06/02/25.
//

import SwiftUI

public struct ProgressItem : Hashable {
    let color : Color
    public let percentage : CGFloat
    let isHighlighted : Bool
    
    public init(color: Color, percentage: CGFloat, isHighlighted : Bool = false) {
        self.color = color
        self.percentage = percentage
        self.isHighlighted = isHighlighted
    }
}

public struct ProgressChartView: View {
    
    let stats : [ProgressItem]
    let totalWidth : CGFloat
    let height : CGFloat
    
    public init(stats: [ProgressItem],totalWidth : CGFloat,height : CGFloat = 20) {
        self.stats = stats
        self.totalWidth = totalWidth
        self.height = height
    }
    
    public var body: some View {
        
        HStack(spacing: 0){
            ForEach(stats, id: \.self) { stat in
                stat.color
                    .frame(width: totalWidth * stat.percentage / 100)
//                    .overlay(
//                        stat.isHighlighted ?
//                        LinearGradient(
//                            gradient: Gradient(colors: [
//                                Color.white.opacity(0.6),
//                                Color.clear,
//                                Color.black.opacity(0.4)
//                            ]),
//                            startPoint: .topLeading,
//                            endPoint: .bottomTrailing
//                        ) : nil
//                    )
                    .shadow(color: stat.isHighlighted ? Color.black.opacity(0.5) : Color.clear, radius: 2, x: 4, y: 4)
                    .shadow(color: stat.isHighlighted ? Color.white.opacity(0.3) : Color.clear, radius: 2, x: -4, y: -4)
                    .overlay(
                        stat.isHighlighted ?
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.white.opacity(0.4), lineWidth: 2)
                            .blur(radius: 1)
                        : nil
                    )
                    .scaleEffect(stat.isHighlighted ? 1 : 1.0) // Slightly enlarges without moving
                    .brightness(stat.isHighlighted ? 0.1 : 0) // Enhances pop effect
            }
            .frame(height: height)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ProgressChartView(stats: [
        .init(color: .blue, percentage: 25, isHighlighted: true),
        .init(color: .red, percentage: 25,isHighlighted: false),
        .init(color: .green, percentage: 25),
        .init(color: .yellow, percentage: 25),
    ], totalWidth: UIScreen.main.bounds.size.width )
}
