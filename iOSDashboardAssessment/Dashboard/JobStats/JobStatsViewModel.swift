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
    
    init(jobs: [JobApiModel]) {
        self.jobs = jobs
    }
    
    func getTotalJobsInfo() -> String{
        return "\(self.jobs.count) jobs"
    }
    
    func getNumberOfCompletedJobs() -> String{
        let completedJobs = self.jobs.filter({$0.status == .completed})
        return "\(completedJobs.count) of \(self.jobs.count) completed"
    }
    
    func getStats() -> [ProgressItem]  {
        let statsWithPercentage = JobStatus.allCases.map { jobStatus in
            
            let numberOfJobsInCurrentStatus = self.jobs.filter { $0.status == jobStatus }.count
            
            let jobPercentage: CGFloat = self.jobs.isEmpty ? 0 : (CGFloat(numberOfJobsInCurrentStatus) / CGFloat(self.jobs.count)) * 100
            
            return ProgressItem(color: jobStatus.color, percentage: CGFloat(jobPercentage))
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
