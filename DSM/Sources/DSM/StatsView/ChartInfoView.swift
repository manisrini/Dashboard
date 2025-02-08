//
//  SwiftUIView.swift
//  DSM
//
//  Created by Manikandan on 06/02/25.
//

import SwiftUI

public struct ChartInfoItem : Hashable{
    let id = UUID()
    let color : Color
    let status : String
    let additionalInfo : String
    
    public init(color: Color, status: String, additionalInfo: String) {
        self.color = color
        self.status = status
        self.additionalInfo = additionalInfo
    }
}

public struct ChartInfoView: View {

    let statData: [ChartInfoItem]
    let columns = [GridItem(.flexible()),GridItem(.flexible())]
    
    public init(statData: [ChartInfoItem]) {
        self.statData = statData
    }
    
    public var body: some View {
        LazyVGrid(columns: columns,alignment: .leading,spacing: 15) {
            ForEach(statData,id: \.id) { item in
                SimpleTagView(
                    fillColor: item.color,
                    text: "\(item.status) (\(item.additionalInfo))"
                )
            }
        }
    }
}

#Preview {
    ChartInfoView(statData: [.init(color: .blue, status: "Yet to start", additionalInfo: "5")])
}
