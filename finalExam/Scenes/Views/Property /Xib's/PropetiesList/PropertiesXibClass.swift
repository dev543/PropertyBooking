//
//  PropertiesXibClass.swift
//  finalExam
//
//  Created by Hyperlink on 28/11/23.
//

import UIKit
import SwiftyJSON

class PropertiesXibClass: UITableViewCell {

    //MARK: - Outlates
    
    @IBOutlet weak var ivHome           : UIImageView!
    @IBOutlet weak var ivBed            : UIImageView!
    @IBOutlet weak var ivBath           : UIImageView!
    @IBOutlet weak var ivLocation       : UIImageView!
    @IBOutlet weak var ivRating         : UIImageView!
    
    @IBOutlet weak var lblName          : UILabel!
    @IBOutlet weak var lblPrice         : UILabel!
    @IBOutlet weak var lblBedCount      : UILabel!
    @IBOutlet weak var lblBed           : UILabel!
    @IBOutlet weak var lblBath          : UILabel!
    @IBOutlet weak var lblBathCount     : UILabel!
    @IBOutlet weak var lblSqft          : UILabel!
    @IBOutlet weak var lblSqftCount     : UILabel!
    @IBOutlet weak var lblAddress       : UILabel!
    @IBOutlet weak var lblRating        : UILabel!
    
    @IBOutlet weak var vwProperties     : UIView!
    
    @IBOutlet weak var btnLikeDisLike   : UIButton!
    //-----------------------------------------
    
    //MARK: - Custom Variables
    
    //-----------------------------------------
    
    //MARK: - Custom Methods
    
    func setupView() {
        self.applyTheme()
    }
    
    func applyTheme() {
        
        self.lblBed.text       = AppMessages.bed
        self.lblBedCount.text  = AppMessages.bedCount
        self.lblBath.text      = AppMessages.bath
        self.lblBathCount.text = AppMessages.bathCount
        self.lblSqft.text      = AppMessages.sqft
        self.lblSqftCount.text = AppMessages.sqftCount
        self.lblAddress.text   = AppMessages.location
        
        self.lblName.font(name: .semiBold, size: 15.0)
            .textColor(color: .black)
        
        self.lblPrice.font(name: .extraBold, size: 16.0)
            .textColor(color: .red)
        
        self.lblBedCount.font(name: .semiBold, size: 14.0)
            .textColor(color: .black)
        
        self.lblBed.font(name: .regular, size: 14.0)
            .textColor(color: .textGray)
        
        self.lblBathCount.font(name: .semiBold, size: 14.0)
            .textColor(color: .black)
        
        self.lblBath.font(name: .regular, size: 14.0)
            .textColor(color: .textGray)
        
        self.lblSqftCount.font(name: .semiBold, size: 14.0)
            .textColor(color: .black)
        
        self.lblSqft.font(name: .regular, size: 14.0)
            .textColor(color: .textGray)
        
        self.lblAddress.font(name: .regular, size: 14.0)
            .textColor(color: .textGray)
        
        self.lblRating.font(name: .medium, size: 12.0)
            .textColor(color: .black)
        
        self.vwProperties.cornerRadius(cornerRadius: 15.0)
    }
    
    func config(_ listData: ListModel) {
        
        self.ivHome.setImage(with: listData.concessionaireLogo)
        self.lblName.text       = listData.concessionaireName
        self.lblPrice.text      = "$\(listData.totalAmount!)"
        self.lblBathCount.text  = listData.id
        self.lblBedCount.text   = listData.orderId        
    }
    
    //----------------------------------------
    
    //MARK: - Actions
    
    @IBAction func btnLikeDisLikeClick(_ sender: Any) {
        
        self.btnLikeDisLike.isSelected.toggle()
    }
    
    
    //----------------------------------------
    
    //MARK: - Lifecycle methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
    //----------------------------------------
    

}
