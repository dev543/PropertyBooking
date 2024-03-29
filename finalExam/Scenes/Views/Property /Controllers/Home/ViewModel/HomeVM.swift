//
//  HomeVM.swift
//  finalExam
//
//  Created by Hyperlink on 28/11/23.
//

import Foundation
import SwiftyJSON

class HomeVM{
    
    //list api Bindable
    private (set) var listData = Bindable<Result<String?, AppError>>()
    
    private var arrOderList : [ListModel] = []
}
//-----------------------------------------------

//MARK: - Array Method

extension HomeVM {
    
 
    func numberOfRowsInSection() -> Int{
        self.arrOderList.count
    }
    
    func cellForRowAt(_ indexPath: Int) -> ListModel{
        self.arrOderList[indexPath]
    }
   
}

//-----------------------------------------------


extension HomeVM{
    
//MARK: - Api call Function
    
    func apiList(userId: Int,page: Int) {
        
        /**
            ===========API CALL===========
            Method Name : Post
            Parameter   : user_id,page
            Comment     : for get order list
            ==============================
            */
        
        let requestParam = RequestParameter()
            .add(.user_id, userId)
            .add(.page, page)
        
        ApiManager.shared.makeRequestWithModel(endPoint: .oder(.OderList), modelType: ModelList<ListModel>.self, responseModelType: .dictonary, parameter: requestParam.dictionaryValue) { [weak self] (result) in
        
            switch result {
            case .success(let apiData):
                
                switch apiData.apiCode {
                
                case .success:
                
                    self?.arrOderList = apiData.data.result
                    
                    self?.listData.value = .success(nil)
                    
                case .emptyData:
                    
                    print("EmptyData")
           
                default: break
                }
                
            case .failure(let error):
                print("the error \(error)🤯🤯🤯🤯")
            }
        }
    }
}
//-----------------------------------------------
