//
//  LoginVC.swift
//  finalExam
//
//  Created by Hyperlink on 27/11/23.
//

import UIKit

class LoginVC: UIViewController {

    //MARK: - Outlates
    
    @IBOutlet weak var ivLogo       : UIImageView!
    @IBOutlet weak var ivBackground : UIImageView!
    
    @IBOutlet weak var lblTitle     : UILabel!
    @IBOutlet weak var lblSubTitle  : UILabel!
    
    @IBOutlet weak var vwLogin      : UIView!
    
    @IBOutlet weak var lblLogin                      : UILabel!
    @IBOutlet weak var lblLetsGetStarted             : UILabel!
    @IBOutlet weak var lblEmail                      : UILabel!
    @IBOutlet weak var lblPassword                   : UILabel!
    @IBOutlet weak var lblForgotPassword             : UILabel!
    @IBOutlet weak var lblDonthaveAnAccountSignUp    : UILabel!
    
    @IBOutlet weak var txtEmail     : UITextField!
    @IBOutlet weak var txtPassword  : UITextField!
    
    @IBOutlet weak var btnPasswordShow  : UIButton!
    @IBOutlet weak var btnLogin         : UIButton!
    
    @IBOutlet weak var stckViewPassword : UIStackView!
    
    //-----------------------------------------
    //MARK: - Custom Variables
    
    let ViewModel = LoginVM()

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
        self.changeLanguage()
  
    }
    
    func applyTheme() {
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.txtEmail.delegate      = self
        self.txtPassword.delegate   = self
        
        self.lblTitle.text                   = AppMessages.aSmarterWayToSave
        self.lblSubTitle.text                = AppMessages.weDontSellDealsWeGiveThemToYou
        self.lblLogin.text                   = AppMessages.logIn
        self.lblLetsGetStarted.text          = AppMessages.letsGetStarted
        self.lblEmail.text                   = AppMessages.emailUsername
        self.lblPassword.text                = AppMessages.password
        self.lblForgotPassword.text          = AppMessages.forgotPassword
        self.lblDonthaveAnAccountSignUp.text = AppMessages.dontHaveAnAccountSignUp
        
        self.btnLogin.setTitle(AppMessages.logIn, for: .normal)
     
        self.lblTitle.font(name: .semiBold, size: 16.0)
            .textColor(color: .white)
        
        self.lblSubTitle.font(name: .semiBold, size: 16.0)
            .textColor(color: .white)
        
        self.lblLogin.font(name: .bold, size: 24.0)
            .textColor(color: .black)
        
        self.lblLetsGetStarted.font(name: .medium, size: 16.0)
            .textColor(color: .textGray)
        
        self.lblEmail.customtheme()
        self.lblPassword.customtheme()
        
        self.lblForgotPassword.font(name: .semiBold, size: 15.0)
            .textColor(color: .black)
        
        self.lblDonthaveAnAccountSignUp.font(name: .semiBold, size: 15.0)
            .textColor(color: .black)
        
        self.btnLogin.font(name: .semiBold, size: 18.0)
            .textColor(color: .white)
        
        self.stckViewPassword.cornerRadius(cornerRadius: 29.5)
            .backGroundColor(color: .whiteBg)
        
        self.txtEmail.placeholder    = AppMessages.emailPlaceholder
        self.txtPassword.placeholder = AppMessages.passwordPlaceholder
   
        self.txtPassword.isSecureTextEntry = true
        
        self.lblForgotPassword.addTapGestureRecognizer {
            
            let vc = ForgetPasswordVC.instantiate(fromAppStoryboard: .main)
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        self.lblDonthaveAnAccountSignUp.addTapGestureRecognizer {
            let vc = SignUpVC.instantiate(fromAppStoryboard: .main)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    
    }
    
    //this func change to languages
    func changeLanguage() {
        
        self.lblTitle.text                       = "ASmarterWayToSave".localize()
        self.lblSubTitle.text                    = "weDontSellDealsWeGiveThemToYou".localize()
        self.lblLogin.text                       = "logIn".localize()
        self.lblLetsGetStarted.text              = "letsGetStarted".localize()
        self.lblEmail.text                       = "emailUsername".localize()
        self.lblPassword.text                    = "password".localize()
        self.lblForgotPassword.text              = "forgotPassword".localize()
        self.lblDonthaveAnAccountSignUp.text     = "dontHaveAnAccountSignUp".localize()
        self.btnLogin.titleLabel?.text           = "logIn".localize()
        self.txtEmail.placeholder                = "emailPlaceholder".localize()
        self.txtPassword.placeholder             = "passwordPlaceholder".localize()
     
    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//            return .darkContent
//        }
    
     func preferredStatusBarStyle() -> UIStatusBarStyle {
     return UIStatusBarStyle.darkContent
    }
    //----------------------------------------
    
    //MARK: - Actions
    
    @IBAction func btnLoginClick(_ sender: Any) {
        
        if let error = self.ViewModel.isValid(email: self.txtEmail.text!, password: self.txtPassword.text!){
            
            Alert.shared.showSnackBar(error.errorDescription!)
            
        }else{
            UserDefaultsConfig.isAuthorization = true
            UIApplication.shared.manageLogin()
        }
        
    }
    
    @IBAction func btnShowHidePassClick(_ sender: Any) {
        
        self.txtPassword.isSecureTextEntry.toggle()
        self.btnPasswordShow.isSelected.toggle()
        
    }
    
    
    //----------------------------------------
    
    //MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        debugPrint("ViewDidLoad")
    }
    
    override func viewDidLayoutSubviews() {
        
        self.vwLogin.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
        self.stckViewPassword.layer.cornerRadius = self.stckViewPassword.frame.height / 2
    }
 
    //----------------------------------------

}

//MARK: - UITextFieldDelegate Method

extension LoginVC: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if (isBackSpace == -92) {
                print("Backspace was pressed")
                return true
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
