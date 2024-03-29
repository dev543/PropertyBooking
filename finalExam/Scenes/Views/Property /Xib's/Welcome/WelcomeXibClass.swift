//
//  WelcomeXibClass.swift
//  finalExam
//
//  Created by Hyperlink on 28/11/23.
//

import UIKit
import SwiftyJSON

class WelcomeXibClass: UICollectionViewCell {

    //MARK: - Outlates
    
    @IBOutlet weak var lblTitle     : UILabel!
    @IBOutlet weak var lblSubTitle  : UILabel!
    
    @IBOutlet weak var ivIndicator  : UIImageView!
    @IBOutlet weak var ivAd         : UIImageView!
    //-----------------------------------------
    
    //MARK: - Custom Variables
    
    //-----------------------------------------
    
    //MARK: - Custom Methods
    
    func setupView() {
        self.applyTheme()
    }
    
    func applyTheme() {
        
        self.lblTitle.font(name: .medium, size: 20.0)
            .textColor(color: .black)
        
        self.lblSubTitle.font(name: .regular, size: 13.0)
            .textColor(color: .textGray)
        
        self.ivAd.cornerRadius(cornerRadius: 30.0)
            .contentMode = .scaleAspectFill
     
        self.ivIndicator.contentMode = .scaleAspectFill
    }
    
    // Confing method
    
    func config(_ json: JSON){
        
        self.ivAd.image        = UIImage(named: json["image"].stringValue)
        self.ivIndicator.image = UIImage(named: json["indicator"].stringValue)
        self.lblTitle.text     = json["title"].stringValue
        self.lblSubTitle.text  = json["subTitle"].stringValue
        
        self.lblTitle.setAttributedStrings(attributedStrings: ["volutpat lectus."], textColors: [UIColor.black], fonts: [.customFont(ofType: .extraBold, withSize: 20.0)], lineSpacing: 0, alignment: .left, isUnderline: false, isStrikeThough: false)
        
    }
    
    //----------------------------------------
    
    //MARK: - Actions
    
    //----------------------------------------
    
    //MARK: - Lifecycle methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
    //----------------------------------------
    

}
