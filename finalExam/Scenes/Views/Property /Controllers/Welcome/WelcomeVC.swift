//
//  WelcomeVC.swift
//  finalExam
//
//  Created by Hyperlink on 28/11/23.
//

import UIKit

class WelcomeVC: UIViewController {

    //MARK: - Outlates
    
    @IBOutlet weak var ivLogo       : UIImageView!
    
    @IBOutlet weak var colWelcomeAd : UICollectionView!
    
    @IBOutlet weak var btnSkip      : UIButton!
    
    @IBOutlet weak var vwNextButton : UIView!
    
    @IBOutlet weak var lblNext      : UILabel!
    //-----------------------------------------
    
    //MARK: - Custom Variables
    
    let viewModel = WelcomeVM()
    var isCollectionCount = 0
 
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
        UserDefaultsConfig.isShowTutorial = true
        
    }
    
    func applyTheme() {
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.btnSkip.font(name: .medium, size: 12.0)
            .backGroundColor(color: .GrayLight)
            .textColor(color: .textGray)
            .setTitle(AppMessages.skip, for: .normal)
        
        self.lblNext.font(name: .medium, size: 12.0)
            .textColor(color: .white)
            .text = AppMessages.next
            
        self.colWelcomeAd.delegate   = self
        self.colWelcomeAd.dataSource = self
        
        let welcomeAdNib = UINib(nibName: "WelcomeXib", bundle: nil)
        self.colWelcomeAd.register(welcomeAdNib, forCellWithReuseIdentifier: "WelcomeXibClass")
        
        self.vwNextButton.addTapGestureRecognizer {
            
            // Scroll Cell of UICollectionView to Right direction by clicking on btnNextClick button action
            let collectionBounds = self.colWelcomeAd.bounds
            let contentOffset = CGFloat(floor(self.colWelcomeAd.contentOffset.x + collectionBounds.size.width))
            
            self.moveCollectionToFrame(contentOffset: contentOffset)
        }
 
    }
    
    // this function Scroll Cell of UICollectionView to Right direction
    
    func moveCollectionToFrame(contentOffset : CGFloat) {
        
        if self.isCollectionCount <= 1 {
            
            let frame: CGRect = CGRect(x : contentOffset ,y : self.colWelcomeAd.contentOffset.y ,width : self.colWelcomeAd.frame.width,height : self.colWelcomeAd.frame.height)
            self.colWelcomeAd.isPagingEnabled = true
            self.colWelcomeAd.scrollRectToVisible(frame, animated: true)
            
        }else {
            UserDefaultsConfig.isShowTutorial = true
            UserDefaultsConfig.isAuthorization = false
            UIApplication.shared.manageLogin()
            
        }
        
    }
    
    //----------------------------------------
    
    //MARK: - Actions
    
    @IBAction func btnSkipClick(_ sender: Any) {
        
        let vc = LoginVC.instantiate(fromAppStoryboard: .main)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //----------------------------------------
    
    //MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        debugPrint("ViewDidLoad")
    }
    
    override func viewDidLayoutSubviews() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.btnSkip.cornerRadius(cornerRadius: self.btnSkip.frame.height / 2)
            self.vwNextButton.cornerRadius(cornerRadius: self.vwNextButton.frame.height / 2)
        })
       
    }
    
    //----------------------------------------

}

//MARK: - UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout

extension WelcomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let objCell = self.colWelcomeAd.dequeueReusableCell(withReuseIdentifier: "WelcomeXibClass", for: indexPath) as! WelcomeXibClass
        self.isCollectionCount = indexPath.item
        objCell.config(self.viewModel.cellForItemAt(indexPath.item))
        return objCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        collectionView.frame.size
        
    }
    
}
//----------------------------------------

