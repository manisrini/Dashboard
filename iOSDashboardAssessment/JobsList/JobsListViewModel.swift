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
        
    func isJobsEmptyForSelectedStatus() -> Bool{
        return jobs.filter({$0.status == currentSelectedStatus}).isEmpty
    }
    
    func getJobsForSelectedStatus() -> [JobApiModel]{
        return jobs.filter({$0.status == currentSelectedStatus})
    }

    
    func getTabs() -> [ZTab]{
        if tabs.isEmpty{
            tabs = JobStatus.allCases.map{ status in
                
                let numberOfJobsInCurrentStatus = self.jobs.filter { $0.status == status }.count

                return ZTab(
                    id: UUID(),
                    title: status.rawValue,
                    displayValue: "\(status.rawValue) (\(numberOfJobsInCurrentStatus))"
                )
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
    
    //MARK: Helper Functions
    func getNavBarTitle() -> String{
        "Jobs (\(jobs.count))"
    }

    func getCardModel(for job : JobApiModel) -> CardModel{
        
        
        var dateStr = ""
        
        if let startDateTime = SampleData.isoFormatter.date(from: job.startTime){
            dateStr += "\(Utils.formatDate(date: startDateTime)) - "
        }
        
        if let endDateTime = SampleData.isoFormatter.date(from: job.endTime){
            dateStr += Utils.formatDate(date: endDateTime)
        }
        
        return .init(
            topLeftLabel: "#\(job.jobNumber)",
            middleLeftLabel: job.title,
            bottomLeftLabel: dateStr
        )
        
        
    }

    
}
