//
//  WelcomeVM.swift
//  finalExam
//
//  Created by Hyperlink on 28/11/23.
//

import Foundation
import SwiftyJSON

class WelcomeVM{
    
    //MARK: - Array
    
    private var arrWelcome : [JSON] = [
    
        [
            "title"     : AppMessages.titleWelcome,
            "subTitle"  : AppMessages.subTitle,
            "image"     : AppMessages.imgWelcomeOne,
            "indicator" : AppMessages.imgIndicatorOne,
        ],
        [
            "title"     : AppMessages.titleWelcome,
            "subTitle"  : AppMessages.subTitle,
            "image"     : AppMessages.imgWelcomeOne,
            "indicator" : AppMessages.imgIndicatorTwo,
        ],
        [
            "title"     : AppMessages.titleWelcome,
            "subTitle"  : AppMessages.subTitle,
            "image"     : AppMessages.imgWelcomeOne,
            "indicator" :  AppMessages.imgIndicatorThree,
        ]
    ]
}
//--------------------------------------

//MARK: - Array Methods

extension WelcomeVM{
    
    func numberOfItemsInSection() -> Int {
        self.arrWelcome.count
    }
    
    func cellForItemAt(_ indexPath: Int) -> JSON {
        self.arrWelcome[indexPath]
    }
}

//--------------------------------------


