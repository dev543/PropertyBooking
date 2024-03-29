//
//  SignUpVM.swift
//  finalExam
//
//  Created by Hyperlink on 27/11/23.
//

import Foundation

class SignUpVM{
    
    //MARK: - Array
    
    private var arrContryCode : [String] = [
        
        "+1","+91","+92"
    
    
    ]
    //---------------------------------------
    //MARK: - Validation Function
    
    func isValid(_ userName: String,_ firstName: String,_ lastName: String,_ email: String,_ phoneNumber: String,_ address: String,_ password: String,_ isSelected: Bool) -> AppError? {
        
        guard !userName.isEmpty else{ return AppError.validation(type: AppError.Enums.ValidationError.enterUserName)}
        guard !firstName.isEmpty else{ return AppError.validation(type: AppError.Enums.ValidationError.enterFirstName)}
        guard !lastName.isEmpty else{ return AppError.validation(type: AppError.Enums.ValidationError.enterlastName)}
        
        guard !email.isEmpty else { return AppError.validation(type: AppError.Enums.ValidationError.enterEmail)}
        guard email.isValid(String.ValidationType.email) else{ return AppError.validation(type: AppError.Enums.ValidationError.enterValidEmail)}
        
        guard !phoneNumber.isEmpty else { return AppError.validation(type: AppError.Enums.ValidationError.enterPhoneNumber)}
        guard phoneNumber.count >= 8 else { return AppError.validation(type: .enterMinMobileNumber)}
        
        guard !address.isEmpty else { return AppError.validation(type: AppError.Enums.ValidationError.enterAddress)}
        
        guard !password.isEmpty else { return AppError.validation(type: AppError.Enums.ValidationError.enterPassword)}
        guard password.count >= 8 else { return AppError.validation(type: AppError.Enums.ValidationError.enterMinPassword)}
        guard password.isValid(String.ValidationType.password) else{ return AppError.validation(type: AppError.Enums.ValidationError.createPassword)}
        
        guard isSelected == true else { return AppError.validation(type: AppError.Enums.ValidationError.selectIAgreeWithTermsAndConditionsPrivacyPolicy)}
        
        return nil
        
    }
    //------------------------------------------
}

//MARK: - Array Function

extension SignUpVM {
    
    func numberOfRowsInComponent() -> Int {
        self.arrContryCode.count
    }
    
    func titleForRow(_ row: Int) -> String {
        self.arrContryCode[row]
    }
    
    func didSelectRow(_ row: Int) -> String {
        self.arrContryCode[row]
    }

}

//------------------------------------------
