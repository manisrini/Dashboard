//
//  LegendView.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 06/02/25.
//
import SwiftUI
import DSM
import Utils

struct GreetingModel{
    let name: String
    let imageUrl : String
    let date : Date
}

struct GreetingView : View{
    
    let model : GreetingModel
    
    init(model: GreetingModel) {
        self.model = model
    }
    
    var body : some View{
        HStack{
            VStack(alignment : .leading,spacing : 5){
                
                ZuperText(
                    name: "Hello, \(model.name)",
                    font: .Roboto(.Bold, 18)
                )
                
                ZuperText(
                    name: "\(Utils.formatDateWithOrdinalSuffix(date: model.date))",
                    font: .Roboto(.Bold, 14)
                )
                .foregroundStyle(Color(DSMColors.secondary_gray))
            }
            
            Spacer()
            
            if let url =  URL(string: model.imageUrl){
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40,height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .padding()
        .roundedBorder(color: Color(DSMColors.light_gray),radius: 2)
    }
}

#Preview {
    GreetingView(
        model: .init(
            name: "Helloo,Manikandan",
            imageUrl: "https://sample-videos.com/img/Sample-jpg-image-500kb.jpg",
            date: Date()
        )
    )
}
