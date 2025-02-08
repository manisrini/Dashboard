//
//  JobsListView.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 08/02/25.
//

import SwiftUI
import DSM
import SampleData

struct JobsListView: View {
    
    @ObservedObject var viewModel : JobsListViewModel
    @State var selectedTabIndex = 0
    
    init(_ viewModel: JobsListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        NavigationStack{
            VStack{
                
                JobStatsView(
                    JobStatsViewModel(
                        jobs: viewModel.jobs,
                        showStatsInfo: false,
                        showHeader: false
                    )
                )
                    .padding()
                
                ZuperTabView(tabs: viewModel.getTabs(), selectedIndex: $selectedTabIndex) { prevSelectedIndex, currentSelectedIndex in
                    if prevSelectedIndex != currentSelectedIndex{
                        viewModel.updateSelectedStatus(for: currentSelectedIndex)
                    }
                }
                
                
                if viewModel.isJobsEmptyForSelectedStatus(){
                    Spacer()
                    EmptyStateView()
                    Spacer()
                } else{
                    ScrollView {
                        LazyVStack(alignment: .leading) {
                            ForEach(viewModel.getJobsForSelectedStatus(),id: \.id) { job in
                                Card(
                                    topLeftLabel: "#\(job.jobNumber)",
                                    middleLeftLabel: job.title,
                                    bottomLeftLabel: "\(job.startTime) - \(job.endTime)"
                                )
                                .roundedBorder(color: .gray)
                                .padding(.horizontal,10)
                                .padding(.vertical,5)
                            }
                        }
                    }
                }
            }
            .zNavBar(viewModel.getNavBarTitle())
        }
    }
}

#Preview {
    JobsListView(JobsListViewModel(jobs: [
        JobApiModel(jobNumber: 1, title: "Test", startTime: "123", endTime: "456", status: .yetToStart),
        JobApiModel(jobNumber: 2, title: "Clean Home", startTime: "123", endTime: "456", status: .yetToStart)
    ]))
}
