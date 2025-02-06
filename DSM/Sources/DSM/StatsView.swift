//
//  SwiftUIView.swift
//  DSM
//
//  Created by Manikandan on 06/02/25.
//

import SwiftUI

struct StatItem : Hashable {
    let color : Color
    let percentage : CGFloat
}

struct StatsView: View {
    
    let stats : [StatItem]
    
    var body: some View {
        
        GeometryReader { reader in
            HStack(spacing: 0){
                ForEach(stats, id: \.self) { stat in
                    let _ = print(reader.size)
                    stat.color
                        .frame(width: reader.size.width * stat.percentage / 100)
                }
            }
            .frame(height: 30)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    StatsView(stats: [
        .init(color: .blue, percentage: 25),
        .init(color: .red, percentage: 25),
        .init(color: .green, percentage: 25),
        .init(color: .yellow, percentage: 25),
    ])
}
