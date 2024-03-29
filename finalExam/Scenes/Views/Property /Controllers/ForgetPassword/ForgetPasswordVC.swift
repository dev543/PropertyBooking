//
//  ForgetPasswordVC.swift
//  finalExam
//
//  Created by Hyperlink on 27/11/23.
//

import UIKit

class ForgetPasswordVC: UIViewController {
    
    //MARK: - Outlates
    
    @IBOutlet weak var vwForgetPassword         : UIView!
    
    @IBOutlet weak var ivLogo                   : UIImageView!
    
    @IBOutlet weak var lblForgetPassword        : UILabel!
    @IBOutlet weak var lblTitle                 : UILabel!
    @IBOutlet weak var lblEmail                 : UILabel!
    
    @IBOutlet weak var txtEmail                 : UITextField!
    
    @IBOutlet weak var btnSubmit                : UIButton!
    
    //-----------------------------------------
    
    //MARK: - Custom Variables
    
    let viewModel = ForgetPasswordVM()
    
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
        
        self.lblForgetPassword.text = AppMessages.forgotPasswordTWo
        self.lblTitle.text          = AppMessages.enterYourEmailAddressAnd
        self.lblEmail.text          = AppMessages.email
        
        self.btnSubmit.setTitle(AppMessages.submit, for: .normal)
        
        self.lblForgetPassword.font(name: .bold, size: 24.0)
            .textColor(color: .black)
        
        self.lblTitle.font(name: .medium, size: 16.0)
            .textColor(color: .textGray)
        
        self.lblEmail.font(name: .regular, size: 15.0)
            .textColor(color: .black)
        
        self.txtEmail.placeholder          = AppMessages.emailPlaceholder
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    //this func change to languages
    func changeLanguage() {
        
        self.lblForgetPassword.text           = "forgotPasswordTWo".localize()
        self.lblEmail.text                    = "email".localize()
        self.lblTitle.text                    = "enterYourEmailAddressAnd".localize()
        self.btnSubmit.titleLabel?.text       = "submit".localize()
        
        self.txtEmail.placeholder             = "emailPlaceholder".localize()
     
    }
                      
    //----------------------------------------
    
    //MARK: - Actions
    @IBAction func btnSubmitClick(_ sender: Any) {
        
        if let error = self.viewModel.isValid(self.txtEmail.text!){
            
            Alert.shared.showSnackBar(error.errorDescription!)
            
        }else {
            
            Alert.shared.showSnackBar(AppMessages.passwordReset)
            self.navigationController?.popViewController(animated: true)
            
        }
        
    }
    
    @IBAction func btnBackClick(_ sender: Any) {

        self.navigationController?.popViewController(animated: true)
        
    }
    //----------------------------------------
    
    //MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        debugPrint("ViewDidLoad")
    }
    
    override func viewDidLayoutSubviews() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.vwForgetPassword.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
            self.navigationController?.navigationBar.isHidden = false
        })
       
    }
    //----------------------------------------
    
}
