//
//  JobStatsViewModel.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 07/02/25.
//
import SampleData
import DSM
import CoreFoundation

class JobStatsViewModel{
    let jobs : [JobApiModel]
    let showStatsInfo : Bool
    let showHeader : Bool
    let selectedIndex : Int?
    
    init(jobs: [JobApiModel], showStatsInfo : Bool = true, showHeader : Bool = true,selectedIndex : Int? = nil) {
        self.jobs = jobs
        self.showStatsInfo = showStatsInfo
        self.showHeader = showHeader
        self.selectedIndex = selectedIndex
    }
    
    func getTotalJobsInfo() -> String{
        return "\(self.jobs.count) jobs"
    }
    
    func getNumberOfCompletedJobs() -> String{
        let completedJobs = self.jobs.filter({$0.status == .completed})
        return "\(completedJobs.count) of \(self.jobs.count) completed"
    }
    
    func getStats() -> [ProgressItem]  {
        let statsWithPercentage = JobStatus.allCases.enumerated().map { index, jobStatus in
            
            let numberOfJobsInCurrentStatus = self.jobs.filter { $0.status == jobStatus }.count
            
            let jobPercentage: CGFloat = self.jobs.isEmpty ? 0 : (CGFloat(numberOfJobsInCurrentStatus) / CGFloat(self.jobs.count)) * 100

            var isHighLighted = false

            if let selectedIndex = selectedIndex{
                isHighLighted = selectedIndex == index ? true : false
            }
            return ProgressItem(color: jobStatus.color, percentage: CGFloat(jobPercentage),isHighlighted: isHighLighted)
        }
        
        return statsWithPercentage.sorted {$0.percentage > $1.percentage }
    }
    
    func getStatsInfo() -> [ChartInfoItem] {
        let statsWithCount = JobStatus.allCases.map { jobStatus in
                        
            let numberOfJobsInCurrentStatus = self.jobs.filter { $0.status == jobStatus }.count
            
            return ChartInfoItem(
                color: jobStatus.color,
                status: jobStatus.rawValue,
                additionalInfo: "\(numberOfJobsInCurrentStatus)"
            )
        }
        
        return statsWithCount
    }
}
