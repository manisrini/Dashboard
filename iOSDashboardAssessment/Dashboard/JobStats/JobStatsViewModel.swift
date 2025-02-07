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
            
            var numberOfJobsInCurrentStatus = 0
            
            self.jobs.map { job in
                if jobStatus == job.status {
                    numberOfJobsInCurrentStatus += 1
                }
                
            }
            
            let jobPercentage: CGFloat = self.jobs.isEmpty ? 0 : (CGFloat(numberOfJobsInCurrentStatus) / CGFloat(self.jobs.count)) * 100

            return ProgressItem(color: jobStatus.color, percentage: CGFloat(jobPercentage))
        }
        
        return statsWithPercentage
    }
    
    func getStatsInfo() -> [ChartInfoItem] {
        let statsWithCount = JobStatus.allCases.map { jobStatus in
            
            var numberOfJobsInCurrentStatus = 0
            
            self.jobs.map { job in
                if jobStatus == job.status {
                    numberOfJobsInCurrentStatus += 1
                }
                
            }

            
            print(jobStatus)
            
            print(numberOfJobsInCurrentStatus)
            
            print()

            return ChartInfoItem(
                color: jobStatus.color,
                status: jobStatus.rawValue,
                count: numberOfJobsInCurrentStatus
            )
        }
        
        return statsWithCount
    }
}
