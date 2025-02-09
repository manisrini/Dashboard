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
                        .padding(10)
                    
                    Button {
                        didClickJobStats = true
                    } label: {
                        JobStatsView(
                            JobStatsViewModel(
                                jobs: viewModel.jobsList
                            )
                        )
                        .roundedBorder(color: Color(DSMColors.light_gray),radius: 2)
                        .padding(10)
                    }
                    .buttonStyle(.plain)
                    .navigationDestination(isPresented: $didClickJobStats) {
                        JobsListView(JobsListViewModel(jobs: self.viewModel.jobsList))
                    }
                    
                    InvoiceStatsView(
                        InvoiceStatsViewModel(
                            invoices: viewModel.invoicesList
                        )
                    )
                    .roundedBorder(color: Color(DSMColors.light_gray),radius: 2)
                    .padding(10)

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
