// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public class SampleData: NSObject {
    
    public static let isoFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }()
    
    private static let jobTitles = ["Amazing", "Fantastic", "Awesome", "Incredible", "Superb"]
    private static let jobNouns = ["Job", "Task", "Project", "Assignment", "Work"]
    
    private static let firstNames = ["John", "Jane", "Alice", "Bob", "Eva"]
    private static let lastNames = ["Doe", "Smith", "Johnson", "Brown", "Lee"]
    
    private static let profileUrls = [
        
        "https://images.unsplash.com/photo-1624670760266-0ddc7639b3a4?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1574774191469-3d7732e5fc8b?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1520085601670-ee14aa5fa3e8?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1578410170179-bb10594ed395?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1624391673156-a7b7f6c5fb12?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    ]

    public static func generateRandomJobList(size: Int) -> [JobApiModel] {
        return (1...size).compactMap { index in
            guard let randomStartTime = generateRandomDate(daysFromNow: 1...30),
                  let randomEndTime = generateRandomDate(daysFromNow: 31...60) else {
                return nil
            }
            return JobApiModel(
                jobNumber: index,
                title: generateRandomJobTitle(),
                startTime: isoFormatter.string(from: randomStartTime),
                endTime: isoFormatter.string(from: randomEndTime),
                status: JobStatus.allCases.randomElement()!
            )
        }
    }

    public static func generateRandomInvoiceList(size: Int) -> [InvoiceApiModel] {
        return (1...size).map { _ in
            InvoiceApiModel(
                invoiceNumber: Int.random(in: 1..<Int.max),
                customerName: generateRandomCustomerName(),
                total: Int.random(in: 1...10) * 1000,
                status: InvoiceStatus.allCases.randomElement()!
            )
        }
    }

    public static func generateRandomCustomerName() -> String {
        return "\(firstNames.randomElement()!) \(lastNames.randomElement()!)"
    }

    private static func generateRandomJobTitle() -> String {
        return "\(jobTitles.randomElement()!) \(jobNouns.randomElement()!)"
    }

    private static func generateRandomDate(daysFromNow range: ClosedRange<Int>) -> Date? {
        return Calendar.current.date(byAdding: .day, value: Int.random(in: range), to: Date())
    }
    
    public static func generateRandomProfileUrl() -> String{
        profileUrls.randomElement()!
    }
}
