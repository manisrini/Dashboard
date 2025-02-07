//
//  DashboardRepository.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 07/02/25.
//

import Foundation
import SampleData

protocol DashboardRepository {
    func getJobsList() async throws -> [JobApiModel]
    func getInvoicesList() async throws -> [InvoiceApiModel]
}

class InMemoryDashboardRepository : DashboardRepository{
    func getJobsList() async throws -> [JobApiModel] {
        return SampleData.generateRandomJobList(size: 10)
    }
    
    func getInvoicesList() async throws -> [InvoiceApiModel] {
        return SampleData.generateRandomInvoiceList(size: 10)
    }
}
