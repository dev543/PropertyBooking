//
//  SignUpVC.swift
//  finalExam
//
//  Created by Hyperlink on 27/11/23.
//

import UIKit
import SwiftUI
import WebKit

class SignUpVC: UIViewController {
    
    //MARK: - Outlates
    
    @IBOutlet weak var lblSignUp                : UILabel!
    @IBOutlet weak var lblToContinue            : UILabel!
    @IBOutlet weak var lblUserName              : UILabel!
    @IBOutlet weak var lblFirstName             : UILabel!
    @IBOutlet weak var lblLastName              : UILabel!
    @IBOutlet weak var lblEmail                 : UILabel!
    @IBOutlet weak var lblPhoneNumber           : UILabel!
    @IBOutlet weak var lblAddress               : UILabel!
    @IBOutlet weak var lblPassword              : UILabel!
    @IBOutlet weak var lblTermsCondition        : UILabel!
    @IBOutlet weak var lblAlreadyHaveAnAccount  : UILabel!
    
    @IBOutlet weak var txtUserName              : UITextField!
    @IBOutlet weak var txtFirstName             : UITextField!
    @IBOutlet weak var txtLastName              : UITextField!
    @IBOutlet weak var txtEmail                 : UITextField!
    @IBOutlet weak var txtCode                  : UITextField!
    @IBOutlet weak var txtPhoneNumber           : UITextField!
    @IBOutlet weak var txtAddress               : UITextField!
    @IBOutlet weak var txtPassword              : UITextField!
    
    @IBOutlet weak var btnShowPassword          : UIButton!
    @IBOutlet weak var btnCheck                 : UIButton!
    @IBOutlet weak var btnSignUp                : UIButton!
    
    @IBOutlet weak var vwSignUp                 : UIView!
    
    @IBOutlet weak var svPhoneNumber            : UIStackView!
    @IBOutlet weak var svPassword               : UIStackView!
    //-----------------------------------------
    
    //MARK: - Custom Variables
    
    let viewModel = SignUpVM()
    
    let picker    = UIPickerView()
    
    private var tappedAction = UITapGestureRecognizer()
    
    var webView: WKWebView!
    
    //-----------------------------------------
    
    //MARK: - Memory Management Methods
    
    deinit {
        debugPrint("💥deinit💥")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        debugPrint("didReceiveMemoryWarning")
    }
    
    //-----------------------------------------
    
    //MARK: - Custom Methods
    
    func setupView() {
        self.applyTheme()
    }
    
    func applyTheme() {
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.setHidesBackButton(true, animated: true)
    
        self.picker.delegate   = self
        self.picker.dataSource = self
        
        self.txtCode.inputView = self.picker
        
        self.txtUserName.delegate    = self
        self.txtFirstName.delegate   = self
        self.txtLastName.delegate    = self
        self.txtEmail.delegate       = self
        self.txtCode.delegate        = self
        self.txtPhoneNumber.delegate = self
        self.txtAddress.delegate     = self
        self.txtPassword.delegate    = self
        
        self.lblSignUp.text               = AppMessages.signUp
        self.lblToContinue.text           = AppMessages.toContinue
        self.lblUserName.text             = AppMessages.username
        self.lblFirstName.text            = AppMessages.firstName
        self.lblLastName.text             = AppMessages.lastName
        self.lblEmail.text                = AppMessages.email
        self.lblPhoneNumber.text          = AppMessages.phoneNumber
        self.lblAddress.text              = AppMessages.address
        self.lblPassword.text             = AppMessages.password
        self.lblTermsCondition.text       = AppMessages.terms
        self.lblAlreadyHaveAnAccount.text = AppMessages.alreadyHaveAnAccountLogIn
        self.txtCode.text                 = AppMessages.code
        self.btnSignUp.setTitle(AppMessages.signUp, for: .normal)
        
        self.lblSignUp.font(name: .bold, size: 24.0)
            .textColor(color: .black)
        
        self.lblToContinue.font(name: .medium, size: 16.0)
            .textColor(color: .DarkTextGray)
        
        self.lblUserName.customtheme()
        self.lblFirstName.customtheme()
        self.lblLastName.customtheme()
        self.lblEmail.customtheme()
        self.lblPhoneNumber.customtheme()
        self.lblAddress.customtheme()
        self.lblPassword.customtheme()
        
        self.txtUserName.placeholder       = AppMessages.usernamePlaceholder
        self.txtFirstName.placeholder      = AppMessages.firstNamePlaceholder
        self.txtLastName.placeholder       = AppMessages.lastNamePlaceholder
        self.txtEmail.placeholder          = AppMessages.emailPlaceholder
        self.txtPhoneNumber.placeholder    = AppMessages.phoneNumberPlaceholder
        self.txtAddress.placeholder        = AppMessages.addressPlaceholder
        self.txtPassword.placeholder       = AppMessages.passwordPlaceholder
        
        self.txtCode.textAlignment  = .left
        self.txtCode.placeholder    = AppMessages.code
        
        self.txtPhoneNumber.font(name: .medium, size: 16.0)
        
        self.txtPassword.font(name: .medium, size: 16.0)
            .isSecureTextEntry = true
        
        self.lblTermsCondition.setAttributedStrings(attributedStrings: [AppMessages.termsAndConditions,AppMessages.privacyPolicy], textColors: [.black,.black], fonts: [.customFont(ofType: .medium, withSize: 15.0), .customFont(ofType: .medium, withSize: 15.0)], lineSpacing: 0.0, alignment: .left, isUnderline: true, isStrikeThough: false)
        
        self.lblAlreadyHaveAnAccount.addTapGestureRecognizer {
            let vc = LoginVC.instantiate(fromAppStoryboard: .main)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        self.tappedAction = UITapGestureRecognizer(target: self, action: #selector(termsTapped(_:)))
        self.lblTermsCondition.addGestureRecognizer(self.tappedAction)
        
        
        //        self.changeLanguage()
    }
    
    //this func change to languages
    func changeLanguage() {
        
        self.lblSignUp.text               = "signUp".localize()
        self.lblToContinue.text           = "toContinue".localize()
        self.lblUserName.text             = "username".localize()
        self.lblFirstName.text            = "firstName".localize()
        self.lblLastName.text             = "lastName".localize()
        self.lblEmail.text                = "email".localize()
        self.lblPhoneNumber.text          = "phoneNumber".localize()
        self.lblAddress.text              = "address".localize()
        self.lblPassword.text             = "password".localize()
        self.lblAlreadyHaveAnAccount.text = "alreadyHaveAnAccountLogIn".localize()
        self.btnSignUp.titleLabel?.text   = "submit".localize()
        
        self.txtUserName.placeholder     = "usernamePlaceholder".localize()
        self.txtFirstName.placeholder    = "firstNamePlaceholder".localize()
        self.txtLastName.placeholder     = "lastNamePlaceholder".localize()
        self.txtPhoneNumber.placeholder  = "phoneNumberPlaceholder".localize()
        self.txtAddress.placeholder      = "addressPlaceholder".localize()
    }
    
    //----------------------------------------
    
    //MARK: - Actions
    
    @objc func termsTapped(_ sender : UITapGestureRecognizer){
        let termsRange = (self.lblTermsCondition.text! as NSString).range(of: AppMessages.termsAndConditions)
        let privacyRange = (self.lblTermsCondition.text! as NSString).range(of: AppMessages.privacyPolicy)
        if self.tappedAction.didTapAttributedTextInLabel(label: self.lblTermsCondition, inRange: termsRange){
            
            let vc = TermsAndConditionsVC.instantiate(fromAppStoryboard: .main)
            self.navigationController?.isNavigationBarHidden = false
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        if self.tappedAction.didTapAttributedTextInLabel(label: self.lblTermsCondition, inRange: privacyRange){
            
            let vc = TermsAndConditionsVC.instantiate(fromAppStoryboard: .main)
            vc.nameChageFlage = true
            self.navigationController?.isNavigationBarHidden = false
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func btnShowPasswordClick(_ sender: Any) {
        self.txtPassword.isSecureTextEntry.toggle()
        self.btnShowPassword.isSelected.toggle()
    }
    
    @IBAction func btnTermsSelectClick(_ sender: Any) {
        self.btnCheck.isSelected.toggle()
    }
    
    @IBAction func btnSignUpCllick(_ sender: Any) {
        
        if let error = self.viewModel.isValid(self.txtUserName.text!, self.txtFirstName.text!, self.txtLastName.text!, self.txtEmail.text!, self.txtPhoneNumber.text!, self.txtAddress.text!, self.txtPassword.text!, self.btnCheck.isSelected){
            Alert.shared.showSnackBar(error.errorDescription ?? "")
        }else{
            
            let vc = OtpVC.instantiate(fromAppStoryboard: .main)
            vc.isPhoneNumberFlage = "\(self.txtCode.text!) \(self.txtPhoneNumber.text!)"
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
    //----------------------------------------
    
    //MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        debugPrint("ViewDidLoad")
    }
    
    override func viewDidLayoutSubviews() {
        
        self.vwSignUp.roundCorners(corners: [.topLeft,.topRight], radius: 20.0)
        
        self.svPassword.cornerRadius(cornerRadius: self.svPassword.frame.height / 2)
            .backGroundColor(color: .whiteBg)
        
        self.svPhoneNumber.cornerRadius(cornerRadius: self.svPassword.frame.height / 2)
            .backGroundColor(color: .whiteBg)
    }
    
    //----------------------------------------
    
}

//MARK: - UIPickerViewDelegate Methods

extension SignUpVC : UIPickerViewDelegate,UIPickerViewDataSource {
    
    @objc(numberOfComponentsInPickerView:) func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    @objc func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.viewModel.numberOfRowsInComponent()
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.viewModel.titleForRow(row)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txtCode.text = self.viewModel.didSelectRow(row)
        self.view.endEditing(true)
    }
}

//----------------------------------------

//MARK: - UITextFieldDelegate Method

extension SignUpVC: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if (isBackSpace == -92) {
                print("Backspace was pressed")
                return true
            }
        }
        
        if self.txtUserName == textField{
            if range.location == 0 && string == " "{
                return false
            }else if string.isValid(.userName) {
                return true
            }else{
                return false
            }
        }
        
        if self.txtFirstName == textField{
            if range.location == 0 && string == " "{
                return false
            }else if string.isValid(.name){
                return true
            }else{
                return false
            }
        }
        
        if self.txtLastName == textField{
            if range.location == 0 && string == " "{
                return false
            }else if string.isValid(.name){
                return true
            }else{
                return false
            }
        }
        
        if self.txtEmail == textField{
            if range.location == 0 && string == " "{
                return false
            }else if string.isValid(.email) || string == " " {
                return false
            }else{
                return true
            }
        }
        
        if self.txtCode == textField{
            return false
        }
        
        if self.txtPhoneNumber == textField {
            if range.location <= 0 && string == " "{
                return false
            }else if range.location < 11 {
                return string.isValid(.number)
            }
            return false
        }
        
        if self.txtAddress == textField{
            if range.location == 0 && string == " "{
                return false
            }else{
                return true
            }
        }
        
        if self.txtPassword == textField{
            if range.location == 0 && string == " "{
                return false
            }else if string.isValid(.password) || string == " " {
                return false
            }else{
                return true
            }
        }
        
        debugPrint("shouldChangeCharactersIn")
        return true
    }
}

//----------------------------------------

