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
    
    init(repository: DashboardRepository) {
        self.repository = repository
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
}
