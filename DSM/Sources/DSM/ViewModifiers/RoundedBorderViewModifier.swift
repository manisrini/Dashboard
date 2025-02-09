//
//  SwiftUIView.swift
//  DSM
//
//  Created by Manikandan on 06/02/25.
//

import SwiftUI

struct RoundedBorderViewModifier: ViewModifier {
    
    var color: Color
    var radius: CGFloat
    var lineWidth: CGFloat
    var fillColor : Color?
    
    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: radius)
                    .fill(fillColor ?? Color.clear)
                    .overlay {
                        RoundedRectangle(cornerRadius: radius)
                            .stroke(color, lineWidth: lineWidth)
                    }
                    .shadow(color: .black.opacity(0.3), radius: 4)
            }
    }
}

extension View {
    public func roundedBorder(lineWidth : CGFloat = 1, color : Color = Color(DSMColors.light_black), radius : CGFloat = 5, fillColor : Color = .clear) -> some View {
    
        self.modifier(
            RoundedBorderViewModifier(
                color: color,
                radius: radius,
                lineWidth: lineWidth,
                fillColor: fillColor
            )
        )
    }
}


