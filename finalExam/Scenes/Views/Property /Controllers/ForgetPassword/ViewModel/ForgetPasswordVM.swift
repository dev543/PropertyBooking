//
//  ForgetPasswordVM.swift
//  finalExam
//
//  Created by Hyperlink on 27/11/23.
//

import Foundation

class ForgetPasswordVM {
    
    //MARK: - Validation Function
    
    func isValid(_ email: String ) -> AppError? {
        
        guard !email.isEmpty else {
            return AppError.validation(type: AppError.Enums.ValidationError.enterEmail)
        }
        
        guard email.isValid(String.ValidationType.email) else{
            return AppError.validation(type: AppError.Enums.ValidationError.enterValidEmail)
        }
        
        return nil
    }
    
}
