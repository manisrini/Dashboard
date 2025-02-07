//
//  SwiftUIView.swift
//  DSM
//
//  Created by Manikandan on 07/02/25.
//

import SwiftUI

public struct HeaderView: View {
    let text : String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .font(.Roboto(.Bold, size: 18))
    }
}

#Preview {
    HeaderView(text: "Testing")
}
