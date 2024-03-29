//
//  GExtension.swift
//  MVVMBasicStructure
//
//  Created by KISHAN_RAJA on 22/09/20.
//  Copyright © 2020 KISHAN_RAJA. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var lightGray: UIColor {
        UIColor(named: "LightGray") ?? .lightText
    }
    
    static var GrayLight: UIColor {
        UIColor(named: "GrayLight") ?? .lightText
    }
    
    static var DarkTextGray: UIColor {
        UIColor(named: "DarkTextGray") ?? .gray
    }
    static var WhiteBgD: UIColor {
        UIColor(named: "WhiteBgD") ?? .gray
    }
    
    static var themeGray: UIColor {
        UIColor(named: "ThemeGray") ?? .gray
    }
    static var black: UIColor {
        UIColor(named: "ThemeBlack") ?? .black
    }
    
    static var textGray: UIColor {
        UIColor(named: "TextGray") ?? .gray
    }
    
    static var whiteBg: UIColor {
        UIColor(named: "WhiteBg") ?? .white
    }
    
    static var BlackShadow: UIColor {
        UIColor(named: "BlackShadow") ?? .black
    }
    
    
}

extension UIColor {
    class func colorFromHex(hex: Int) -> UIColor { return UIColor(red: (CGFloat((hex & 0xFF0000) >> 16)) / 255.0, green: (CGFloat((hex & 0xFF00) >> 8)) / 255.0, blue: (CGFloat(hex & 0xFF)) / 255.0, alpha: 1.0)
    }
    
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.black
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
}
