//
//  JobsListViewModel.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 08/02/25.
//

import Foundation
import SampleData
import DSM

class JobsListViewModel {
    let jobs : [JobApiModel]
    
    init(jobs: [JobApiModel]) {
        self.jobs = jobs
    }
    
    func getTabs() -> [ZTab] {
        return self.jobs.map { job in
            return ZTab(id: job.id, title: job.status.rawValue)
        }
    }
}
