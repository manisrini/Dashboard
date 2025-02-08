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
    
    var viewModel : JobsListViewModel
    @State var selectedTabIndex = 0
    
    init(_ viewModel: JobsListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        
        VStack{
            ZuperTabView(tabs: viewModel.getTabs(), selectedIndex: $selectedTabIndex) { prevSelectedIndex, currentSelectedIndex in
                print(prevSelectedIndex,currentSelectedIndex)
            }
            
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.jobs,id: \.id) { job in
                        Card(
                            topLeftLabel: "#\(job.jobNumber)",
                            middleLeftLabel: job.title,
                            bottomLeftLabel: "\(job.startTime) - \(job.endTime)"
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    JobsListView(JobsListViewModel(jobs: [
        JobApiModel(jobNumber: 1, title: "Test", startTime: "123", endTime: "456", status: .yetToStart),
        JobApiModel(jobNumber: 2, title: "Clean Home", startTime: "123", endTime: "456", status: .yetToStart)
    ]))
}
