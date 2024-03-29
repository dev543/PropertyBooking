//
//  OtpVC.swift
//  finalExam
//
//  Created by Hyperlink on 27/11/23.
//

import UIKit

class OtpVC: UIViewController {
    
    //MARK: - Outlates
    
    @IBOutlet weak var lblTitle         : UILabel!
    @IBOutlet weak var lblTimer         : UILabel!
    @IBOutlet weak var lblResendOptin   : UILabel!
    
    @IBOutlet weak var txtOne           : UITextField!
    @IBOutlet weak var txtTwo           : UITextField!
    @IBOutlet weak var txtThree         : UITextField!
    @IBOutlet weak var txtFour          : UITextField!
    
    @IBOutlet weak var btnVerify        : UIButton!
    @IBOutlet weak var btnReSendCode    : UIButton!
    
    @IBOutlet weak var nvTitle          : UINavigationItem!
    @IBOutlet weak var vwOtp            : UIView!
    //-----------------------------------------
    
    //MARK: - Custom Variables
    
    let viewModel = OtpVM()
    
    var seconds = 60 //This variable will hold a starting value of seconds.
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    var isPhoneNumberFlage : String?
    
    //-----------------------------------------
    
    //MARK: - Memory Management Methods
    
    deinit {
        self.timer.invalidate()
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
        self.startTime()
    }
    
    func applyTheme() {
        
        self.navigationController?.isNavigationBarHidden = false
        
        self.navigationController?.clearNavigation(font: UIFont.customFont(ofType: .medium, withSize: 16.0), textColor: UIColor.white, navigationColor: .clear, largeTitleColor: .white)
        
        self.lblTitle.text = "\(AppMessages.title)\(isPhoneNumberFlage!)"
        
        self.lblTitle.font(name: .medium, size: 16.0)
            .textColor(color: .DarkTextGray)
//            .text = "\(AppMessages.title)\(isPhoneNumberFlage!)"
        
        self.lblTimer.font(name: .medium, size: 16.0)
            .textColor(color: .red)
            .isHidden = true
        
        self.lblResendOptin.text = AppMessages.resendCodeIn
        self.lblResendOptin.font(name: .regular, size: 16.0)
            .textColor(color: .textGray)
            .isHidden = true
        
        self.btnReSendCode.isHidden = true
        self.btnReSendCode.font(name: .regular, size: 16.0)
            .setTitle(AppMessages.resendotp, for: .normal)
        
        self.btnVerify.setTitle(AppMessages.verify, for: .normal)
        
        self.vwOtp.cornerRadius(cornerRadius: 20.0)
        
    }
    
    //this func change to languages
    func changeLanguage() {
        
        self.btnVerify.titleLabel?.text     = "verify".localize()
        self.btnReSendCode.titleLabel?.text = "resendCodeIn".localize()
        self.nvTitle.title                  = "mobile".localize()
    
    }
    //-----------------------
    
    func runTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        self.isTimerRunning = true
        self.lblTimer.isHidden = false
        self.lblResendOptin.isHidden = false
        
        
    }
    
    func startTime() {
  
            self.runTimer()
            self.lblTimer.isHidden = false
            self.lblResendOptin.isHidden = false
            self.btnReSendCode.isHidden = true
            self.btnReSendCode.isEnabled = false
 
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            self.timer.invalidate()
//            Alert.shared.showSnackBar(AppMessages.timeSUp)
            self.btnReSendCode.isEnabled = true
            self.btnReSendCode.isHidden = false
            self.lblTimer.isHidden = true
            self.lblResendOptin.isHidden = true
 
        } else {
            self.seconds -= 1
            print(seconds)
            self.lblTimer.text = timeString(time: TimeInterval(seconds))
            self.lblTimer.textAlignment = .center
        }
    }
    
    //time formet set function
    func timeString(time:TimeInterval) -> String {

        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    //----------------------------------------
    
    //MARK: - Actions
    
    @IBAction func btnReSendCodeClick(_ sender: Any) {
        
        self.seconds = 60
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        self.txtOne.text   = ""
        self.txtTwo.text   = ""
        self.txtThree.text = ""
        self.txtFour.text  = ""
        self.startTime()
        
    }
    
    @IBAction func btnVerifyClick(_ sender: Any) {
        
        if let error = self.viewModel.validation(self.txtOne.text!, self.txtTwo.text!, self.txtThree.text!, self.txtFour.text!){
            Alert.shared.showSnackBar(error.errorDescription ?? "")
        }else{
            
            let vc = HomeVC.instantiate(fromAppStoryboard: .main)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func btnBackClick(_ sender : UIButton){
        self.navigationController?.popViewController(animated: true)
        self.timer.invalidate()
    }
    //----------------------------------------
    
    //MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        debugPrint("ViewDidLoad")
    }
    
    override func viewDidLayoutSubviews() {
        self.vwOtp.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
    }
    
    //----------------------------------------
    
}



