//
//  JobsListViewModel.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 08/02/25.
//

import Foundation
import SampleData
import DSM
import Utils

class JobsListViewModel : ObservableObject {
    @Published var jobs : [JobApiModel]
    @Published var currentSelectedStatus : JobStatus = .yetToStart

    var tabs : [ZTab] = []
    
    init(jobs: [JobApiModel]) {
        self.jobs = jobs
        self.currentSelectedStatus = JobStatus.allCases.first ?? .yetToStart
    }
    
    func refreshList(){
        //Local Update : Change the title of the first element under the selected tab
        if let job = jobs.filter({ $0.status == currentSelectedStatus }).first{
            
        }
        if let index = jobs.firstIndex(where: { $0.status == currentSelectedStatus }) {
            let firstJob = jobs[index]
            let updatedJob = JobApiModel(
                jobNumber: firstJob.jobNumber,
                title: "Updated -> Clean Home",
                startTime: firstJob.startTime,
                endTime: firstJob.endTime,
                status: firstJob.status
            )
            self.jobs[index] = updatedJob
        }
        
    }
    
    func getSelectedStatusJobs() -> [JobApiModel] {
        return jobs.filter({$0.status == currentSelectedStatus})
    }
    
    
    func isJobsEmptyForSelectedStatus() -> Bool{
        return jobs.filter({$0.status == currentSelectedStatus}).isEmpty
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
        
        
        let jobNumber = "#\(job.jobNumber)"
        let jobTitle = job.title
        var dateStr = ""
        guard let startDateTime = SampleData.isoFormatter.date(from: job.startTime) else{
            return CardModel(topLeftLabel: jobNumber,middleLeftLabel: jobTitle)
        }
        
        guard let endDateTime = SampleData.isoFormatter.date(from: job.endTime) else {
            dateStr += Utils.formatDate(date: startDateTime)
            return CardModel(topLeftLabel: jobNumber,middleLeftLabel: jobTitle,bottomLeftLabel: dateStr)
        }

        //Both start and end time is present
        let calendar = Calendar.current
        if calendar.isDate(startDateTime, inSameDayAs: endDateTime) {
            if calendar.isDateInToday(startDateTime){
                // Today, 10.20 - 11.20 AM
                dateStr += "Today,  \(Utils.formatDate(date: startDateTime))  ->  \(Utils.formatTime(date: endDateTime))"
            }else{
                // 12/12/2022, 10.20 - 11.20 AM
                dateStr += "\(Utils.formatDate(date: startDateTime)),  \(Utils.formatTime(date: startDateTime))  ->  \(Utils.formatTime(date: endDateTime))"
            }
        }else{
            //12/12/2022, 10.20 AM - 14/12/2022, 10.20 AM
            dateStr += "\(Utils.formatDate(date: startDateTime)),  \(Utils.formatTime(date: startDateTime))  ->  \(Utils.formatDate(date: endDateTime)),  \((Utils.formatTime(date: endDateTime)))"
        }

        
        return .init(
            topLeftLabel: "#\(job.jobNumber)",
            middleLeftLabel: job.title,
            bottomLeftLabel: dateStr
        )
    }

    
    
}
