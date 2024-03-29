//
//  HomeVC.swift
//  finalExam
//
//  Created by Hyperlink on 28/11/23.
//

import UIKit

class HomeVC: UIViewController {

    //MARK: - Outlates
    
    @IBOutlet weak var lblName          : UILabel!
    @IBOutlet weak var lblHI            : UILabel!
    @IBOutlet weak var lblProperties    : UILabel!
        
    @IBOutlet weak var ivProfile        : UIImageView!
        
    @IBOutlet weak var vwSearch         : UIView!
    @IBOutlet weak var txtSerach        : UITextField!
    
    @IBOutlet weak var tblProperties    : UITableView!
    
    @IBOutlet weak var loader           : UIActivityIndicatorView!
    
    @IBOutlet weak var btnLogOut        : UIBarButtonItem!
    
    //-----------------------------------------
    
    //MARK: - Custom Variables
    
    let viewModel = HomeVM()
    
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
        self.setupViewModelObserver()
        self.darkStatusBar()
        
        self.viewModel.apiList(userId: 1, page: 1)
        
        self.loader.startAnimating()
        self.loader.color = .black
        self.loader.style = .large
        
        UIApplication.shared.statusBarUIView?.overrideUserInterfaceStyle = .dark
        
    }
    
    func applyTheme() {
     
        self.navigationController?.clearNavigation(font: UIFont.customFont(ofType: .semiBold, withSize: 16.0), textColor: UIColor.black, navigationColor: .clear, largeTitleColor: .black)
        
        self.btnLogOut.font(name: .semiBold, size: 14.0)
            .textColor(color: .black)
        
        self.lblHI.text         = AppMessages.hi
        self.lblName.text       = AppMessages.name
        self.lblProperties.text = AppMessages.properties
        
        self.lblHI.font(name: .sFProTextSemibold, size: 16.0)
        self.lblName.font(name: .sFProTextSemibold, size: 16.0)
        
        self.lblHI.textColor(color: .textGray)
        self.lblName.textColor(color: .black)
        
        self.ivProfile.image = UIImage(named: AppMessages.imgProfile)
        self.ivProfile.contentMode = .scaleAspectFill
        self.ivProfile.cornerRadius(cornerRadius: 12.0)
        
        self.vwSearch.cornerRadius(cornerRadius: 12.0)
            .borderColor(color: .lightGray, borderWidth: 1.0)
        
        self.txtSerach.placeholder = AppMessages.search
        self.txtSerach.placeHolderColor = .textGray
        
        self.txtSerach.font(name: .sFProTextRegular, size: 14.0)
        
        self.lblProperties.font(name: .semiBold, size: 16.0)
            .textColor(color: .black)
        
        self.tblProperties.delegate   = self
        self.tblProperties.dataSource = self
        
        let propertyNib = UINib(nibName: "PropertiesXIB", bundle: nil)
        self.tblProperties.register(propertyNib, forCellReuseIdentifier: "PropertiesXibClass")
    
}
    func darkStatusBar(){
        
        var preferredStatusBarStyle: UIStatusBarStyle {
           return .darkContent
       }
    }
    //MARK: - Observer
    
    private func setupViewModelObserver() {
        // Result binding observer
        self.viewModel.listData.bind(observer: { (result) in
            
            switch result {
            case .success(_):
                
                self.tblProperties.reloadData()
                self.loader.stopAnimating()
             
            case .failure(let error):
                Alert.shared.showSnackBar(error.errorDescription ?? "", isError: true)
                
            case .none: break
                
            }
        })
    }
    //-------------------------------------------
    //----------------------------------------
    
    //MARK: - Actions
    
    @IBAction func btnLogOutClick(_ sender: Any) {
        
        Alert.shared.showAlert("", actionOkTitle: AppMessages.logout, actionCancelTitle: AppMessages.cancel, message: AppMessages.logoutMessage) { logout in
            UIApplication.shared.logoutAppUser()
        }
    
    }
    //----------------------------------------
    
    //MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    //----------------------------------------

}

//MARK: - UITableViewDelegate,UITableViewDataSource

extension HomeVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objCell = self.tblProperties.dequeueReusableCell(withIdentifier: "PropertiesXibClass", for: indexPath) as! PropertiesXibClass
        objCell.config(self.viewModel.cellForRowAt(indexPath.row))
        return objCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objCell = self.tblProperties.dequeueReusableCell(withIdentifier: "PropertiesXibClass", for: indexPath) as! PropertiesXibClass
        let vc = DetailVC.instantiate(fromAppStoryboard: .main)

        vc.isUserId = objCell.lblBathCount.text!
        vc.isOderId = objCell.lblBedCount.text!
        
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
}
//----------------------------------------
