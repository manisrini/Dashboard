//
//  CardView.swift
//  DSM
//
//  Created by Manikandan on 08/02/25.
//

import SwiftUI
import Utils

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
        VStack(alignment : .leading,spacing: 3){
            ZuperText(name: model.topLeftLabel,font: .Roboto(.Medium, 14))
                .foregroundStyle(Color(DSMColors.secondary_gray))
            
            if let middleLeftLabel = model.middleLeftLabel{
                ZuperText(name: middleLeftLabel,font: .Roboto(.Bold, 16))
                    .foregroundStyle(Color(DSMColors.dark_blue))
                    .padding(.top,5)
            }
            
            if let bottomLeftLabel = model.bottomLeftLabel{
                ZuperText(name: bottomLeftLabel,font: .Roboto(.Medium, 14))
                    .foregroundStyle(Color(DSMColors.secondary_gray))
            }
        }
        .padding()
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

#Preview {
    Card(for: .init(topLeftLabel: "Clean Home",middleLeftLabel: "Come on", bottomLeftLabel: "Hello"))
}
