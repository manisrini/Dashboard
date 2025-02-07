//
//  File.swift
//  
//
//  Created by SabariZuper on 15/05/24.
//

import Foundation
import SwiftUICore

public struct JobApiModel {
    public let id = UUID()
    public let jobNumber: Int
    public let title: String
    public let startTime: String
    public let endTime: String
    public let status: JobStatus
    
    public init(jobNumber: Int, title: String, startTime: String, endTime: String, status: JobStatus) {
        self.jobNumber = jobNumber
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.status = status
    }
}

public enum JobStatus: String,CaseIterable{
    case yetToStart = "Yet to start",
         inProgress = "In-Progress",
         cancelled = "Cancelled",
         completed = "Completed",
         incomplete = "In-Complete"
    
    public var color: Color {
        switch self {
        case .yetToStart: return .purple
        case .inProgress: return .blue
        case .cancelled: return .yellow
        case .completed: return .green
        case .incomplete: return .red
        }
    }
}
