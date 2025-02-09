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
    func getUserName() async throws -> String
    func getDate() async throws -> Date
    func getProfileUrl() async throws -> String
}

class InMemoryDashboardRepository : DashboardRepository{
    
    func getJobsList() async throws -> [JobApiModel] {
        return SampleData.generateRandomJobList(size: 100)
    }
    
    func getInvoicesList() async throws -> [InvoiceApiModel] {
        return SampleData.generateRandomInvoiceList(size: 10)
    }
    
    func getUserName() async throws -> String {
        return SampleData.generateRandomCustomerName()
    }
    
    func getDate() async throws -> Date {
        return Date()  //Return today's date
    }

    func getProfileUrl() async throws -> String {
        return SampleData.generateRandomProfileUrl()
    }

}
