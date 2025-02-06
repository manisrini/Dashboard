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
    let date : String
}

struct GreetingView : View{
    
    let model : GreetingModel
    
    var body : some View{
        HStack{
            VStack(alignment : .leading,spacing : 5){
                Text(model.name)
                
                Text(model.date)
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
        .roundedBorder()
    }
}

#Preview {
    GreetingView(
        model: .init(
            name: "Helloo,Manikandan",
            image: .init(systemName: "alarm"),
            date: "12/12/2025"
        )
    )
}
