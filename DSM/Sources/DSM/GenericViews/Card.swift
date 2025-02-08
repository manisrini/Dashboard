//
//  CardView.swift
//  DSM
//
//  Created by Manikandan on 08/02/25.
//

import SwiftUI


public struct CardModel {
    let topLeftLabel : String
    let middleLeftLabel : String?
    let bottomLeftLabel : String?
    
    public init(topLeftLabel: String, middleLeftLabel: String? = "", bottomLeftLabel: String? = "") {
        self.topLeftLabel = topLeftLabel
        self.middleLeftLabel = middleLeftLabel
        self.bottomLeftLabel = bottomLeftLabel
    }
}

public struct Card : View{
    
    let model : CardModel
    
    public init(for model : CardModel) {
        self.model = model
    }
    
    public var body: some View{
        VStack(alignment : .leading,spacing: 10){
            ZuperText(name: model.topLeftLabel,font: .Roboto(.Medium, 14))
                .foregroundStyle(.gray)
            
            if let middleLeftLabel = model.middleLeftLabel{
                ZuperText(name: middleLeftLabel,font: .Roboto(.Bold, 16))
            }
            
            if let bottomLeftLabel = model.bottomLeftLabel{
                ZuperText(name: bottomLeftLabel,font: .Roboto(.Medium, 14))
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

#Preview {
    Card(for: .init(topLeftLabel: "Clean Home",middleLeftLabel: "Come on", bottomLeftLabel: "Hello"))
}
