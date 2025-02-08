//
//  EmptyStateView.swift
//  DSM
//
//  Created by Manikandan on 08/02/25.
//
import SwiftUI

public struct EmptyStateView : View{
    
    let message : String
    
    public init(message: String = "No data found") {
        self.message = message
    }
    
    public var body: some View{
        VStack(spacing : 10){
            Image(.emptyBox)
                .resizable()
                .frame(width: 100,height: 100)

            ZuperText(name: message,font: .Roboto(.BoldItalic, 18))
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    EmptyStateView()
}
