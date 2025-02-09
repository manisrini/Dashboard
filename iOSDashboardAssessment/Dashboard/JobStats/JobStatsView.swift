//
//  JobStatsView.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 07/02/25.
//

import SwiftUI
import SampleData
import DSM

struct JobStatsView: View {
    
    let viewModel : JobStatsViewModel
    
    init(_ viewModel: JobStatsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            
            if viewModel.showHeader{
                HeaderView(text: "Job Stats")
                    .padding(.horizontal,10)

                Divider()
            }
            
            ProgressInfoView(
                leftLabel: viewModel.getTotalJobsInfo(),
                rightLabel: viewModel.getNumberOfCompletedJobs()
            )
            .padding(.horizontal,10)

            
            GeometryReader{ reader in
                ProgressChartView(stats: viewModel.getStats(), totalWidth: reader.size.width)
            }
            .frame(height: 20)
            .padding(.horizontal,10)

            if viewModel.showStatsInfo{
                ChartInfoView(statData: viewModel.getStatsInfo())
                        .padding(.horizontal,15)
                        .padding(.top,10)
            }
        }
        .padding(.vertical,15)
    }
}

#Preview {
    JobStatsView(
        .init(
            jobs: [
                JobApiModel(jobNumber: 1, title: "Test", startTime: "123", endTime: "456", status: .yetToStart),
                JobApiModel(jobNumber: 2, title: "Clean Home", startTime: "123", endTime: "456", status: .yetToStart)

            ]
        )
    )
}
