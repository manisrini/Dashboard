//
//  File.swift
//  
//
//  Created by SabariZuper on 15/05/24.
//

import Foundation
import SwiftUI
import DSM

public struct InvoiceApiModel {
    public let id = UUID()
    public let invoiceNumber: Int
    public let customerName: String
    public let total: Int
    public let status: InvoiceStatus
    
    public init(invoiceNumber: Int, customerName: String, total: Int, status: InvoiceStatus) {
        self.invoiceNumber = invoiceNumber
        self.customerName = customerName
        self.total = total
        self.status = status
    }
}

public enum InvoiceStatus: String,CaseIterable {
    case draft = "Draft", pending = "Pending", paid = "Paid", badDebt = "Bad Debt"
    
    public var color : Color{
        
        switch self {
        case .draft: return Color(DSMColors.yellow)
        case .pending: return Color(DSMColors.light_blue)
        case .paid: return Color(DSMColors.light_green)
        case .badDebt: return Color(DSMColors.light_red)
        }
    }
}

