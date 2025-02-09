//
//  DashboardViewModel.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 07/02/25.
//
import SampleData
import SwiftUI

class DashboardViewModel : ObservableObject{
    let repository : DashboardRepository
    @Published var jobsList : [JobApiModel] = []
    @Published var invoicesList : [InvoiceApiModel] = []
    @Published var greetingDetails : GreetingModel = .init(name: "", imageUrl: "", date: Date())
    
    init(repository: DashboardRepository) {
        self.repository = repository
    }
    
    func fetchDashboardData() async{
        await self.getJobsList()
        await self.getInvoicesList()
        await self.getUserDetails()
    }
    
    func getJobsList() async{
        do {
           let jobsList = try await repository.getJobsList()
            DispatchQueue.main.async {
                self.jobsList = jobsList
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getInvoicesList() async{
        do {
            let invoicesList = try await repository.getInvoicesList()
            DispatchQueue.main.async {
                self.invoicesList = invoicesList
            }

        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getUserDetails() async {
        do {
            let userName = try await repository.getUserName()
            let date = try await repository.getDate()
            let profileUrl = try await repository.getProfileUrl()
            DispatchQueue.main.async {
                self.greetingDetails = GreetingModel(
                    name: "\(userName)!👋",
                    imageUrl: profileUrl,
                    date: date
                )
            }

        } catch {
            print(error.localizedDescription)
        }
    }
}
