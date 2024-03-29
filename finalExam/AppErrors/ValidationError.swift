//
//  ValidationError.swift
//  MVVMBasicStructure
//
//  Created by KISHAN_RAJA on 03/03/21.
//

import Foundation

extension AppError.Enums {
    enum ValidationError {
        case enterUserName
        case enterFirstName
        case enterlastName
        case enterAddress
        case selectIAgreeWithTermsAndConditionsPrivacyPolicy
        case enterValidEmail
        case enterEmail
        case enterEmailUsername
        case enterPassword
        case enterName
        case enterValidName
        case enterMinName
        case enterPhoneNumber
        case enterMinMobileNumber
        case enterCountryCode
        case enterConfirmPassword
        case passwordMismatch
        case enterMinPassword
        case enterNewPassword
        case enterCurrentPassword
        case enterMinNewPassword
        case createPassword
        case enterOTP
        case validOTP
        case invalidOTP
        case invalidCredentials
        case custom(errorDescription: String?)
    }
}

extension AppError.Enums.ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .enterValidEmail: return "Please enter valid email"
        case .enterEmail: return "Please enter email"
        case .enterEmailUsername: return "Please enter email/username"
        case .enterPassword: return "Please enter password"
        case .enterName: return "Please enter name"
        case .enterValidName: return "Please enter valid name"
        case .enterMinName: return "Please enter minimum of two characters in name"
        case .enterPhoneNumber: return "Please enter phone number"
        case .enterMinMobileNumber: return "Please enter minimum 8 and maximum 11 digit for phone number"
        case .enterCountryCode: return "Please select country code"
        case .enterConfirmPassword: return "Please enter confirm password"
        case .passwordMismatch: return "Password mismatch"
        case .enterMinPassword: return "Please enter minimum of 8 characters for create password"
        case .enterNewPassword: return "Please enter new password"
        case .enterCurrentPassword: return "Please enter current password"
        case .enterMinNewPassword: return "Please enter minimum of 8 characters for password."
        case .enterOTP: return "Please enter OTP"
        case .validOTP: return "Please enter valid OTP"
        case .invalidOTP: return "invalid OTP"
        case .enterUserName: return "Please enter user name"
        case .enterFirstName: return "Please enter first name"
        case .enterlastName: return "Please enter last name"
        case .enterAddress: return "Please enter address"
        case .selectIAgreeWithTermsAndConditionsPrivacyPolicy: return "Please select i agree with terms and conditions & privacy policy."
        case .invalidCredentials: return "Invalid credentials"
        case .createPassword: return "Must contain at least one number and one lowercase letter, and at least 8 or more characters"
        case .custom(let errorDescription): return errorDescription
        }
    }
}
