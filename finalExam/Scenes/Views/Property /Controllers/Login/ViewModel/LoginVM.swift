//
//  LoginVM.swift
//  finalExam
//
//  Created by Hyperlink on 27/11/23.
//

import Foundation

class LoginVM{
    
    //  MARK: Validation Function

    func isValid(email: String,password: String) -> AppError? {
        
        guard !email.isEmpty else{
            return AppError.validation(type: AppError.Enums.ValidationError.enterEmailUsername)
        }
        
        guard !password.isEmpty else{
            return AppError.validation(type: AppError.Enums.ValidationError.enterPassword)
        }
        
        guard password.count >= 8 else { return AppError.validation(type: .invalidCredentials)}
        
        guard email == "test123@gmail.com" else { return AppError.validation(type: AppError.Enums.ValidationError.enterEmailUsername) }
        
        guard password == "Test1234@" else { return AppError.validation(type: AppError.Enums.ValidationError.invalidCredentials) }
        
        return nil
    }
    
}
