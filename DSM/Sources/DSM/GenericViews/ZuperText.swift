//
//  SwiftUIView.swift
//  DSM
//
//  Created by Manikandan on 21/01/25.
//

import SwiftUI

public struct ZuperText: View {
    
    let name : String
    let font: Fonts
    
    public init(name: String, font: Fonts = .Roboto(.Regular, 14)){
        self.name = name
        self.font = font
    }
    
    public var body: some View {
        Text(name)
            .customFontStyle(font)
    }
}


#Preview {
    ZuperText(name: "Mani")
}
