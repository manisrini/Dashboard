//
//  ContentView.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 08/02/25.
//

import SwiftUI
import DSM

struct ContentView: View {
    
    @State var fontsRegistered : Bool = false
    
    var body: some View {
        Group{
            if fontsRegistered{
                DashboardView()
            } else{
                ProgressView("Loading ...")
            }
        }
        .onAppear{
            FontHelper.registerFonts()
            fontsRegistered = true
        }
        
    }
}

#Preview {
    ContentView()
}
