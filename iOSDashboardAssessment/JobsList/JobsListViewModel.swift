//
//  JobsListViewModel.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 08/02/25.
//

import Foundation
import SampleData
import DSM

class JobsListViewModel : ObservableObject {
    let jobs : [JobApiModel]
    var tabs : [ZTab] = []
    @Published var currentSelectedStatus : JobStatus = .yetToStart
    
    init(jobs: [JobApiModel]) {
        self.jobs = jobs
        self.currentSelectedStatus = JobStatus.allCases.first ?? .yetToStart
    }
    
    func getNavBarTitle() -> String{
        "Jobs (\(jobs.count))"
    }
    
    func isJobsEmptyForSelectedStatus() -> Bool{
        return jobs.filter({$0.status == currentSelectedStatus}).isEmpty
    }
    
    func getJobsForSelectedStatus() -> [JobApiModel]{
        return jobs.filter({$0.status == currentSelectedStatus})
    }

    
    func getTabs() -> [ZTab]{
        if tabs.isEmpty{
            tabs = JobStatus.allCases.map{ status in
                return ZTab(id: UUID(), title: status.rawValue)
            }
        }
        return tabs
    }
    
    func updateSelectedStatus(for index : Int) {
        if index < tabs.count{
            let statusStr = tabs[index].title
            if let status = JobStatus(rawValue: statusStr){
                self.currentSelectedStatus = status
            }
        }
    }
}
