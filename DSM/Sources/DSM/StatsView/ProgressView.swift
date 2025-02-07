//
//  SwiftUIView.swift
//  DSM
//
//  Created by Manikandan on 06/02/25.
//

import SwiftUI

public struct ProgressItem : Hashable {
    let color : Color
    let percentage : CGFloat
    
    public init(color: Color, percentage: CGFloat) {
        self.color = color
        self.percentage = percentage
    }
}

public struct ProgressChartView: View {
    
    let stats : [ProgressItem]
    let totalWidth : CGFloat
    
    public init(stats: [ProgressItem],totalWidth : CGFloat) {
        self.stats = stats
        self.totalWidth = totalWidth
    }
    
    public var body: some View {
        
        HStack(spacing: 0){
            ForEach(stats, id: \.self) { stat in
                stat.color
                    .frame(width: totalWidth * stat.percentage / 100)
            }
            .frame(height: 20)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ProgressChartView(stats: [
        .init(color: .blue, percentage: 25),
        .init(color: .red, percentage: 25),
        .init(color: .green, percentage: 25),
        .init(color: .yellow, percentage: 25),
    ], totalWidth: UIScreen.main.bounds.size.width )
}
