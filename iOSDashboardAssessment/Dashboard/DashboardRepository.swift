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
    func getUserDetails() async throws -> GreetingModel
}

class InMemoryDashboardRepository : DashboardRepository{
    
    func getJobsList() async throws -> [JobApiModel] {
        return SampleData.generateRandomJobList(size: 1000)
    }
    
    func getInvoicesList() async throws -> [InvoiceApiModel] {
        return SampleData.generateRandomInvoiceList(size: 1000)
    }
    
    func getUserDetails() async throws -> GreetingModel {
        let userName = SampleData.generateRandomCustomerName()
        let userProfileUrl = SampleData.generateRandomProfileUrl()
        let date = Date()
        
        return GreetingModel(
            name: userName,
            imageUrl: userProfileUrl,
            date: date
        )
    }
}
