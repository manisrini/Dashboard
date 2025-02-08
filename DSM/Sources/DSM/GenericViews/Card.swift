//
//  CardView.swift
//  DSM
//
//  Created by Manikandan on 08/02/25.
//

import SwiftUI

public struct Card : View{
    
    let topLeftLabel : String
    let middleLeftLabel : String?
    let bottomLeftLabel : String?
    
    public init(topLeftLabel: String, middleLeftLabel : String? = "", bottomLeftLabel : String? = "") {
        self.topLeftLabel = topLeftLabel
        self.middleLeftLabel = middleLeftLabel
        self.bottomLeftLabel = bottomLeftLabel
    }
    
    public var body: some View{
        VStack(alignment : .leading,spacing: 10){
            ZuperText(name: topLeftLabel,font: .Roboto(.Medium, 14))
            
            if let middleLeftLabel = middleLeftLabel{
                ZuperText(name: middleLeftLabel,font: .Roboto(.Bold, 16))
            }
            
            if let bottomLeftLabel = bottomLeftLabel{
                ZuperText(name: bottomLeftLabel,font: .Roboto(.Medium, 14))
            }
        }
        .padding()
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

#Preview {
    Card(topLeftLabel: "Clean Home",middleLeftLabel: "Come on", bottomLeftLabel: "Hello")
}
