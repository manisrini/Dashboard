//
//  LegendView.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 06/02/25.
//
import SwiftUI
import DSM

struct GreetingModel{
    let name: String
    let image : UIImage?
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
                    font: .Roboto(.BoldItalic, 18)
                )
                
                ZuperText(name: "\(Utils.formatDate(date: model.date))")
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            if let image = model.image {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray)
                    .overlay {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 40,height: 40)
                    }
                    .frame(width: 50,height: 50)
                
            }
        }
        .padding()
        .roundedBorder(color: .gray)
    }
}

#Preview {
    GreetingView(
        model: .init(
            name: "Helloo,Manikandan",
            image: .init(systemName: "alarm"),
            date: Date()
        )
    )
}
