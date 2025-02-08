//
//  DashboardView.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 07/02/25.
//

import SwiftUI
import DSM

struct DashboardView: View {
    
    @ObservedObject var viewModel = DashboardViewModel(repository: InMemoryDashboardRepository())
    @State var didClickJobStats : Bool = false
    
    var body: some View {
        
        NavigationStack{
            GeometryReader{ _ in
                VStack(spacing : 15){
                    GreetingView(model: viewModel.greetingDetails)
                        .padding(.top,10)
                    
                    JobStatsView(
                        JobStatsViewModel(
                            jobs: viewModel.jobsList
                        )
                    )
                    .padding(20)
                    .onTapGesture {
                        didClickJobStats = true
                    }
                    .navigationDestination(isPresented: $didClickJobStats) {
                        JobsListView(JobsListViewModel(jobs: self.viewModel.jobsList))
                    }
                    
                    InvoiceStatsView(
                        InvoiceStatsViewModel(
                            invoices: viewModel.invoicesList
                        )
                    )
                    .padding(.horizontal,20)
                    
                }
            }
            .zNavBar("Dashboard")
        }
        .onAppear{
            Task{
                await viewModel.fetchDashboardData()
            }
        }
    }
}

#Preview {
    DashboardView()
}
