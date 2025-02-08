//
//  ZuperTextModifier.swift
//  DSM
//
//  Created by Manikandan on 08/02/25.
//
import SwiftUI


struct NavBarViewModifier : ViewModifier{
    
    let title : String
    
    func body(content: Content) -> some View {
        content
            .toolbar{
                ToolbarItem(placement : .topBarLeading) {
                    ZuperText(name : title,font: .Roboto(.Bold, 20))
                }
            }
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .overlay {
                VStack{
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color.gray)
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
            }
    }
}



extension View {
    public func zNavBar(_ title : String) -> some View{
        self.modifier(NavBarViewModifier(title: title))
    }
}

