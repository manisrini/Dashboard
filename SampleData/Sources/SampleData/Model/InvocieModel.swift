//
//  File.swift
//  
//
//  Created by SabariZuper on 15/05/24.
//

import Foundation
import SwiftUI

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
        case .draft: return .yellow
        case .pending: return .blue
        case .paid: return .green
        case .badDebt: return .red
        }
    }
}

