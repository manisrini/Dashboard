//
//  ProgressInfoView.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 08/02/25.
//

import SwiftUI
import DSM

struct ProgressInfoView: View {
    
    let leftLabel : String
    let rightLabel : String
    
    var body: some View {
        HStack{
            ZuperText(
                name : leftLabel,
                font: .Roboto(.Bold, 14)
            )
            .foregroundStyle(.gray)

            Spacer()
            
            ZuperText(
                name : rightLabel,
                font: .Roboto(.Bold, 14)
            )
            .foregroundStyle(.gray)
        }
        

    }
}

#Preview {
    ProgressInfoView(leftLabel: "Left", rightLabel: "Right")
}
