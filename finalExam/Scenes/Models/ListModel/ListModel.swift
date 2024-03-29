//
//  ListModel.swift
//  finalExam
//
//  Created by Hyperlink on 29/11/23.
//

import Foundation


import Foundation
import SwiftyJSON


class ListModel : Mappable {
  
    var concessionaireId : Int!
    var concessionaireLogo : String!
    var concessionaireName : String!
    var dishList : [DishList]!
    var dropoffLatitude : String!
    var dropoffLongitude : String!
    var estimatedTime : String!
    var id : String!
    var orderDatetime : String!
    var orderId : String!
    var pickupLatitude : String!
    var pickupLongitude : String!
    var rating : Int!
    var runnerId : String!
    var runnerLatitude : String!
    var runnerLongitude : String!
    var status : String!
    var tip : Int!
    var totalAmount : Int!
    var totalItems : Int!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */

    required init(fromJson json: JSON){
        if json.isEmpty{
            return
        }
        concessionaireId = json["concessionaire_id"].intValue
        concessionaireLogo = json["concessionaire_logo"].stringValue
        concessionaireName = json["concessionaire_name"].stringValue
        dishList = [DishList]()
        let dishListArray = json["dish_list"].arrayValue
        for dishListJson in dishListArray{
            let value = DishList(fromJson: dishListJson)
            dishList.append(value)
        }
        dropoffLatitude = json["dropoff_latitude"].stringValue
        dropoffLongitude = json["dropoff_longitude"].stringValue
        estimatedTime = json["estimated_time"].stringValue
        id = json["id"].stringValue
        orderDatetime = json["order_datetime"].stringValue
        orderId = json["order_id"].stringValue
        pickupLatitude = json["pickup_latitude"].stringValue
        pickupLongitude = json["pickup_longitude"].stringValue
        rating = json["rating"].intValue
        runnerId = json["runner_id"].stringValue
        runnerLatitude = json["runner_latitude"].stringValue
        runnerLongitude = json["runner_longitude"].stringValue
        status = json["status"].stringValue
        tip = json["tip"].intValue
        totalAmount = json["total_amount"].intValue
        totalItems = json["total_items"].intValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if concessionaireId != nil{
            dictionary["concessionaire_id"] = concessionaireId
        }
        if concessionaireLogo != nil{
            dictionary["concessionaire_logo"] = concessionaireLogo
        }
        if concessionaireName != nil{
            dictionary["concessionaire_name"] = concessionaireName
        }
        if dishList != nil{
            var dictionaryElements = [[String:Any]]()
            for dishListElement in dishList {
                dictionaryElements.append(dishListElement.toDictionary())
            }
            dictionary["dish_list"] = dictionaryElements
        }
        if dropoffLatitude != nil{
            dictionary["dropoff_latitude"] = dropoffLatitude
        }
        if dropoffLongitude != nil{
            dictionary["dropoff_longitude"] = dropoffLongitude
        }
        if estimatedTime != nil{
            dictionary["estimated_time"] = estimatedTime
        }
        if id != nil{
            dictionary["id"] = id
        }
        if orderDatetime != nil{
            dictionary["order_datetime"] = orderDatetime
        }
        if orderId != nil{
            dictionary["order_id"] = orderId
        }
        if pickupLatitude != nil{
            dictionary["pickup_latitude"] = pickupLatitude
        }
        if pickupLongitude != nil{
            dictionary["pickup_longitude"] = pickupLongitude
        }
        if rating != nil{
            dictionary["rating"] = rating
        }
        if runnerId != nil{
            dictionary["runner_id"] = runnerId
        }
        if runnerLatitude != nil{
            dictionary["runner_latitude"] = runnerLatitude
        }
        if runnerLongitude != nil{
            dictionary["runner_longitude"] = runnerLongitude
        }
        if status != nil{
            dictionary["status"] = status
        }
        if tip != nil{
            dictionary["tip"] = tip
        }
        if totalAmount != nil{
            dictionary["total_amount"] = totalAmount
        }
        if totalItems != nil{
            dictionary["total_items"] = totalItems
        }
        return dictionary
    }
}
