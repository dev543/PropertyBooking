//
//  DetailVC.swift
//  finalExam
//
//  Created by Hyperlink on 28/11/23.
//

import UIKit

class DetailVC: UIViewController {
    
    //MARK: - Outlates
    
    @IBOutlet weak var ivHome           : UIImageView!
    @IBOutlet weak var ivProfile        : UIImageView!
    @IBOutlet weak var ivBath           : UIImageView!
    @IBOutlet weak var ivBed            : UIImageView!
    @IBOutlet weak var ivLayer          : UIImageView!
    
    @IBOutlet weak var lblName          : UILabel!
    @IBOutlet weak var lblOwner         : UILabel!
    @IBOutlet weak var lblBedCount      : UILabel!
    @IBOutlet weak var lblBathCount     : UILabel!
    @IBOutlet weak var lbllayerCount    : UILabel!
    @IBOutlet weak var lblAbout         : UILabel!
    @IBOutlet weak var lblAboutDetails  : UILabel!
    
    @IBOutlet weak var vwProfile        : UIView!
    
    @IBOutlet weak var btnBookNow       : UIButton!
    
    @IBOutlet weak var loader           : UIActivityIndicatorView!
    
    //-----------------------------------------
    
    //MARK: - Custom Variables
    
    let  viewModel = DetailVM()
    
    var isUserId : String?
    var isOderId : String?
    
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
        self.lightStatusBar()
        
        self.loader.startAnimating()
        self.loader.color = .black
        self.loader.style = .medium
        
        self.viewModel.apiOderDetail(userId: "1", orderId: "1")
        
        UIApplication.shared.statusBarUIView?.overrideUserInterfaceStyle = .light
        
    }
    
    func applyTheme() {
        
        self.lblAbout.text      = AppMessages.about
        self.lblOwner.text      = AppMessages.owner
        self.lblBedCount.text   = AppMessages.bedCount
        self.lblBathCount.text  = AppMessages.bathCount
        self.lbllayerCount.text = AppMessages.sqftCount
        
        self.ivHome.contentMode = .scaleAspectFill
        
        self.ivBath.image = UIImage(named: AppMessages.imgDetailBath)
        self.ivBath.contentMode = .scaleAspectFill
        
        self.ivBed.image = UIImage(named: AppMessages.imgDetailBed)
        self.ivBed.contentMode = .scaleAspectFill
        
        self.ivLayer.image = UIImage(named: AppMessages.imgDetailLayer)
        self.ivLayer.contentMode = .scaleAspectFill
        
        self.vwProfile.cornerRadius(cornerRadius: 12.0)
            .shadow(color: .WhiteBgD, shadowOffset: CGSize(width: 0.0, height: 5.0), shadowOpacity: 1.0)
        
        self.ivProfile.cornerRadius(cornerRadius: 12.0)
        
        self.lblBedCount.customThemeDetail()
        self.lblBathCount.customThemeDetail()
        self.lbllayerCount.customThemeDetail()
        
        self.lblName.font(name: .sFProTextMedium, size: 14.0)
            .textColor(color: .black)
        
        self.lblOwner.font(name: .sFProTextRegular, size: 14.0)
            .textColor(color: .textGray)
        
        self.lblAbout.font(name: .semiBold, size: 14.0)
            .textColor(color: .black)
        
        self.lblAboutDetails.font(name: .sFProTextRegular, size: 14.0)
            .textColor(color: .textGray)
        
        self.btnBookNow.setTitle(AppMessages.bookNow, for: .normal)
                
    }
    
    func lightStatusBar(){
        
        var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
       }
   
    }
    
    func setData(_ detils: DetailModel?) {
        
        if let detils = detils {
            self.lblName.text         = detils.runnerName
            self.lblAboutDetails.text = detils.pickupAddress
            self.ivHome.setImage(with: detils.concessionaireLogo)
     
        }
    }
    
    //MARK: - Observer
    
    private func setupViewModelObserver() {
        // Result binding observer
        self.viewModel.listDetailData.bind(observer: { (result) in
            switch result {
            case .success(_):
                
                self.setData(self.viewModel.getStoreData())
                self.loader.stopAnimating()
                
            case .failure(let error):
                Alert.shared.showSnackBar(error.errorDescription ?? "", isError: true)
                
            case .none: break
            }
        })
    }
    //-------------------------------------------
    
    func shareFunction(){
        
        //Set the default sharing message.
        let message = "Message"
        //Set the link to share.
        if let link = NSURL(string: "http://yoururl.com")
        {
            let objectsToShare = [message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    //----------------------------------------
    
    //MARK: - Actions
    
    @IBAction func btnBackClick(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnMessageClick(_ sender: Any) {
        self.shareFunction()
    }
    
    @IBAction func btnCallClick(_ sender: Any) {
        self.shareFunction()
   
    }
    
    @IBAction func btnBookNowClick(_ sender: Any) {
        
        Alert.shared.showSnackBar(AppMessages.booked)
    }
    
    //----------------------------------------
    
    //MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        debugPrint("ViewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
//        self.lightStatusBar()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        var preferredStatusBarStyle: UIStatusBarStyle {
            .darkContent
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    //----------------------------------------
}
