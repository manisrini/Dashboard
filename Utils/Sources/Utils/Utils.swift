// The Swift Programming Language
// https://docs.swift.org/swift-book
import UIKit

public class Utils {
    
    
    public static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#"))
        {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6)
        {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    public static func formatDate(date : Date,format : String = "dd/MM/yyyy") -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    public static func formatDateWithOrdinalSuffix(date: Date, format: String = "EEEE, MMM d yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format

        let formattedDate = dateFormatter.string(from: date)

        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let ordinalSuffix = getOrdinalSuffix(for: day)

        // Insert the ordinal suffix into the formatted date
        return formattedDate.replacingOccurrences(of: " \(day) ", with: " \(day)\(ordinalSuffix) ")
    }

    private static func getOrdinalSuffix(for day: Int) -> String {
        switch day {
        case 11...13: return "th" // Special case for 11th, 12th, 13th alone
        default:
            switch day % 10 {
            case 1: return "st"
            case 2: return "nd"
            case 3: return "rd"
            default: return "th"
            }
        }
    }
    
    public static func formatTime(date : Date,format : String = "h.mm a") -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }

}
