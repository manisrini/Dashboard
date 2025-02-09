//
//  SwiftUIView.swift
//  DSM
//
//  Created by Manikandan on 06/02/25.
//

import SwiftUI

struct SimpleTagView: View {
    
    let fillColor : Color
    let text : String
    
    var body: some View {
        
        HStack{
            RoundedRectangle(cornerRadius: 5)
                .fill(fillColor)
                .frame(width: 15,height: 15)
            
            ZuperText(name : text, font: .Roboto(.Bold, 14))
                .foregroundStyle(Color(DSMColors.secondary_gray))
        }
        
    }
}

#Preview {
    SimpleTagView(fillColor: .accentColor, text: "Households")
}
