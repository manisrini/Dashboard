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
        GeometryReader{ reader in
            VStack(alignment: .leading,spacing: 16){
                HeaderView(text: "Job Stats")
                
                Divider()
                
                HStack{
                    Text(viewModel.getTotalJobsInfo())
                    Spacer()
                    Text(viewModel.getNumberOfCompletedJobs())
                }
                                
                ProgressChartView(stats: viewModel.getStats(), totalWidth: reader.size.width)
                
                ChartInfoView(statData: viewModel.getStatsInfo())
            }
        }
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
