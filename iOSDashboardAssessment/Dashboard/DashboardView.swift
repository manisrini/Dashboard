//
//  DashboardView.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 07/02/25.
//

import SwiftUI

struct DashboardView: View {
    
    @ObservedObject var viewModel = DashboardViewModel(repository: InMemoryDashboardRepository())
    
    var body: some View {
        VStack(spacing : 15){
            GreetingView(
                model: .init(
                    name: "Mani",
                    image: nil,
                    date: "\(Date())"
                )
            )
            
            JobStatsView(
                JobStatsViewModel(
                    jobs: viewModel.jobsList
                )
            )
            .padding(.horizontal,20)
        }
        .onAppear{
            Task{
                await viewModel.getJobsList()
            }
        }
    }
}

#Preview {
    DashboardView()
}
