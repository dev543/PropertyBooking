//
//  OtpVM.swift
//  finalExam
//
//  Created by Hyperlink on 27/11/23.
//

import Foundation

class OtpVM {
    
    //MARK: - Validation
 
        func validation(_ txtOne : String,_ txtTwo : String,_ txtThree : String,_ txtFour : String) -> AppError? {
            
            guard !txtOne.isEmpty else { return AppError.validation(type: .enterOTP)}
            guard !txtTwo.isEmpty else { return AppError.validation(type: .enterOTP)}
            guard !txtThree.isEmpty else { return AppError.validation(type: .enterOTP)}
            guard !txtFour.isEmpty else { return AppError.validation(type: .enterOTP)}
            
            guard txtOne == "1" && txtTwo == "2" && txtThree == "3" && txtFour == "4" else { return AppError.validation(type: AppError.Enums.ValidationError.invalidOTP)}
            
            return nil
        }
}
