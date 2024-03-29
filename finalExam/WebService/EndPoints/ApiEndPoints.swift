//
//  ApiEndPoints.swift
//  MVVMBasicStructure
//
//  Created by KISHAN_RAJA on 18/12/20.
//

import UIKit

/// ApiEndPoints - This will be main api points
enum ApiEndPoints {
    case user(User)
    case registration(Registration)
    case oder(Oder)
    
    /// API methods name.
    var methodName : String {
        switch self {
        case .user(let user):
            return "user/" +  user.rawValue
            
        case .registration(let registration):
            return "/user/registration/" + registration.rawValue
            
    case .oder(let oder):
        return "/order/" + oder.rawValue
    }
    }
}

/// User Endpoints
enum User: String {
    case signup                         = "register"
    case device                         = "device"
    case login                          = "login"
    case forgotPassword                 = "forgot-password"
    case changePassword                 = "change-password"
    case userProfile                    = "profile"
    case logout                         = "logout"
    case editProfile                    = "profile/update"
}

/// Registration Endpoints
enum Registration: String {
    case sendOTP                         = "otp/send"
    case verifyOTP                       = "otp/verify"
}

/// Oder Endpoints
enum Oder: String {
    case OderList                        = "order_list"
    case OderDetail                      = "order_details"
}
