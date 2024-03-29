//
//  DetailVM.swift
//  finalExam
//
//  Created by Hyperlink on 28/11/23.
//

import Foundation
import SwiftUI

class DetailVM{
    
    private(set) var listDetailData = Bindable<Result<String?, AppError>>()
    
    private var storeDetails : DetailModel?
    
}

//-------------------------------

extension DetailVM {
    
    //MARK: - Array Methods
    
    func getStoreData() -> DetailModel? {
        self.storeDetails
    }
    
    //-------------------------------
    
    //MARK: - Api call Function
    
    func apiOderDetail(userId: String,orderId: String){
        
        /**
         ===========API CALL===========
         Method Name : Post
         Parameter    :  user_id,order_id
         Comment     :  for get order details
         ==============================
         */
        let requestParam = RequestParameter()
            .add(.user_id, userId)
            .add(.order_id, orderId)
        
        ApiManager.shared.makeRequestWithModel(endPoint: .oder(.OderDetail), modelType: DetailModel.self, responseModelType: .dictonary, parameter: requestParam.dictionaryValue) { [weak self] (result) in
            
            
            guard let self = self else { return }
            
            switch result {
            case .success(let apiData):
                
                switch apiData.apiCode {
                case .success:
                    
                    self.storeDetails = apiData.data
                    self.listDetailData.value = .success(nil)
                    
                    print("\(apiData)")
                    
                case .emptyData:
                    
                    print("EmptyData")
                    
                default: break
                }
                
            case.failure(let error):
                print("error \(error)🤯🤯🤯🤯")
            }
        }
    }
    
    //-------------------------------
}
