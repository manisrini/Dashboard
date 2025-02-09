//
//  InvoiceStatsView.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 08/02/25.
//

import SwiftUI
import SampleData
import DSM

struct InvoiceStatsView: View {
    
    let viewModel : InvoiceStatsViewModel
    
    init(_ viewModel: InvoiceStatsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading,spacing: 16){
            HeaderView(text: "Invoice Stats")
                .padding(.horizontal,10)

            Divider()
            
            ProgressInfoView(
                leftLabel: viewModel.getTotalInvoiceAmountInfo(),
                rightLabel: viewModel.getPaidAmountInfo()
            )
            .padding(.horizontal,10)

            GeometryReader{ reader in
                ProgressChartView(stats: viewModel.getStats(), totalWidth: reader.size.width)
            }
            .frame(height: 20)
            .padding(.horizontal,10)

            ChartInfoView(statData: viewModel.getStatsInfo())
                .padding(.horizontal,10)
        }
        .padding(.vertical,15)
    }
}

#Preview {
    InvoiceStatsView(
        .init(
            invoices: [
                .init(invoiceNumber: 1, customerName: "Mani", total: 300, status: .paid),
                .init(invoiceNumber: 2, customerName: "Mani", total: 500, status: .badDebt)
            ]
        )
    )
}
