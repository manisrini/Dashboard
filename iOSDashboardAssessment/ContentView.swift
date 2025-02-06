//
//  ContentView.swift
//  iOSDashboardAssessment
//
//  Created by SabariZuper on 15/05/24.
//

import SwiftUI
import SampleData

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "laptopcomputer")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Happy coding!")
            
        }
        .padding()
        .onAppear{
            let jobs = SampleData.generateRandomJobList(size: 10)
            for job in jobs {
                print("job => \(job.title) - \(job.status)")
            }
        }
    }
}

#Preview {
    ContentView()
}



