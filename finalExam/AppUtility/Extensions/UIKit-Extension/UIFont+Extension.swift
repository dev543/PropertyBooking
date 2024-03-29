//
//  GExtension+UIFont.swift
//  MVVMBasicStructure
//
//  Created by KISHAN_RAJA on 22/09/20.
//  Copyright © 2020 KISHAN_RAJA. All rights reserved.
//

import UIKit

extension UIFont {
    
    enum FontType: String {
        case thin                    = "Roboto-Thin"
        case thinItalic              = "Roboto-ThinItalic"
        case italic                  = "Roboto-Italic"
        case regular                 = "Manrope-Regular"
        case light                   = "Roboto-Light"
        case lightItalic             = "Roboto-LightItalic"
        case medium                  = "Manrope-Medium"
        case mediumItalic            = "Roboto-MediumItalic"
        case bold                    = "Manrope-Bold"
        case semiBold                = "Manrope-SemiBold"
        case boldItalic              = "Roboto-BoldItalic"
        case black                   = "Roboto-Black"
        case blackItalic             = "Roboto-BlackItalic"
        case sFProTextSemibold       = "SFProText-Semibold"
        case sFProTextRegular        = "SFProText-Regular"
        case sFProTextMedium         = "SFProText-Medium"
        case extraBold               = "Manrope-ExtraBold"
    }
    
    /// Set custom font
    /// - Parameters:
    ///   - type: Font type.
    ///   - size: Size of font.
    ///   - isRatio: Whether set font size ratio or not. Default true.
    /// - Returns: Return font.
    class func customFont(ofType type: FontType, withSize size: CGFloat, enableAspectRatio isRatio: Bool = true) -> UIFont {
        return UIFont(name: type.rawValue, size: isRatio ? size * ScreenSize.fontAspectRatio : size) ?? UIFont.systemFont(ofSize: size)
    }
}

