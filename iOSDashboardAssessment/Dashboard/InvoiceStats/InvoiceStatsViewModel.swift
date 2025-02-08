//
//  InvoiceStatsViewModel.swift
//  iOSDashboardAssessment
//
//  Created by Manikandan on 08/02/25.
//
import SampleData
import DSM
import CoreFoundation

class InvoiceStatsViewModel {
    let invoices : [InvoiceApiModel]
    
    init(invoices: [InvoiceApiModel]) {
        self.invoices = invoices
    }
    
    func getTotalInvoiceAmountInfo() -> String{
        return "Total value ($\(getTotalInvoiceAmount()))"
    }
    
    func getPaidAmountInfo() -> String{
        return "$\(getPaidAmount()) collected"
    }
    
    
    func getStats() -> [ProgressItem]  {
        let statsWithPercentage = InvoiceStatus.allCases.map { invoiceStatus in
                        
            let numberOfInvoicesInCurrentStatus = self.invoices.filter ({$0.status == invoiceStatus}).count
            
            let invoicePercentage: CGFloat = self.invoices.isEmpty ? 0 : (CGFloat(numberOfInvoicesInCurrentStatus) / CGFloat(self.invoices.count)) * 100

            return ProgressItem(color: invoiceStatus.color, percentage: CGFloat(invoicePercentage))
        }
        
        return statsWithPercentage.sorted {$0.percentage > $1.percentage }
    }
    
    func getStatsInfo() -> [ChartInfoItem] {
        let statsWithCount = InvoiceStatus.allCases.map { invoiceStatus in
            
            let totalAmountInCurrentStatus = self.invoices.filter({$0.status == invoiceStatus}).reduce(0) {$0 + $1.total}
            
            return ChartInfoItem(
                color: invoiceStatus.color,
                status: invoiceStatus.rawValue,
                additionalInfo: "$\(totalAmountInCurrentStatus)"
            )
        }
        
        return statsWithCount
    }
    
    private func getTotalInvoiceAmount() -> Int{
        let totalInvoiceAmount = self.invoices.reduce(0) { $0 + $1.total}
        return totalInvoiceAmount
    }

    
    private func getPaidAmount() -> Int{
        let paidInvoices = invoices.filter({ $0.status == .paid })
        
        var paidAmount = 0
        for invoice in paidInvoices {
            paidAmount += invoice.total
        }
        
        return paidAmount
    }
    
}

