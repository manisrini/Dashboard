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
    @State private var progress: CGFloat = 0  // Track the animation progress

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
                    .frame(maxWidth: .infinity)
                    .if(stat.isHighlighted) { view in
                        view.overlay{
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(DSMColors.dark_blue), lineWidth: 3)
                                .shadow(color: Color(DSMColors.dark_blue),radius: 1)
                        }
                    }
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


extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
