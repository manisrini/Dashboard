//
//  Untitled.swift
//  DSM
//
//  Created by Manikandan on 09/02/25.
//
import Utils
import UIKit

public struct DSMColors{
    public static let light_gray = Utils.hexStringToUIColor(hex: DSMColorTokens.light_gray.rawValue)
    public static let light_red = Utils.hexStringToUIColor(hex: DSMColorTokens.light_red.rawValue)
    public static let light_blue = Utils.hexStringToUIColor(hex: DSMColorTokens.light_blue.rawValue)
    public static let light_purple = Utils.hexStringToUIColor(hex: DSMColorTokens.light_purple.rawValue)
    public static let purple = UIColor.purple
    public static let yellow = Utils.hexStringToUIColor(hex: DSMColorTokens.yellow.rawValue)
    public static let secondary_gray = Utils.hexStringToUIColor(hex: DSMColorTokens.secondary_gray.rawValue)
    public static let dark_blue = Utils.hexStringToUIColor(hex: DSMColorTokens.dark_blue.rawValue)
    public static let light_black = Utils.hexStringToUIColor(hex: DSMColorTokens.light_black.rawValue)
    public static let light_green = Utils.hexStringToUIColor(hex: DSMColorTokens.light_green.rawValue)
    public static let gray = UIColor.gray
    public static let black = UIColor.black
}

private enum DSMColorTokens : String{
    
    case light_gray = "D3D3D3"
    case light_red = "FF6961"
    case light_blue = "ADD8E6"
    case light_purple = "CBC3E3"
    case yellow = "FFFF00"
    case secondary_gray = "8B8BA1"
    case dark_blue = "191A45"
    case light_black = "414a4c"
    case light_green = "90EE90"
}
