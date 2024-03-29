//
//  TermsAndConditionsVC.swift
//  finalExam
//
//  Created by Hyperlink on 04/12/23.
//

import UIKit
import WebKit

class TermsAndConditionsVC: UIViewController {
    
    //MARK: - Outlates
    
    @IBOutlet weak var webGoogle          : WKWebView!
        
    @IBOutlet weak var nvName             : UINavigationItem!
    
    //-----------------------------------------
    
    //MARK: - Custom Variables
    
    var webView : WKWebView!
    
    var nameChageFlage = false
    
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
        self.setName()
    }
    
    func applyTheme() {
        
        self.navigationController?.navigationBar.isHidden = false
         
        let myURL = URL(string:"https://www.google.com")
        let myRequest = URLRequest(url: myURL!)
        webGoogle.load(myRequest)
    }
    
    func setName() {
        
        if nameChageFlage == true {
            self.nvName.title = "Privacy Policy"
            let myURL = URL(string:"https://www.youtube.com")
            let myRequest = URLRequest(url: myURL!)
            webGoogle.load(myRequest)
        }
    }
    
    //----------------------------------------
    
    //MARK: - Actions
    
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
    
    //----------------------------------------
}
