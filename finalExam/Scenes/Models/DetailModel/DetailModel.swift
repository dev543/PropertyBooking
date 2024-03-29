//
//  DetailModel.swift
//  finalExam
//
//  Created by Hyperlink on 28/11/23.
//

import Foundation
import SwiftyJSON


class DetailModel : Mappable {
  
    var acceptedAt : String!
    var adminCommission : Int!
    var cancelBy : String!
    var cancelReason : String!
    var cancelledAt : String!
    var cardId : Int!
    var completedAt : String!
    var completedbyConcessionaire : String!
    var concessionaireCommission : Int!
    var concessionaireId : Int!
    var concessionaireLogo : String!
    var concessionaireName : String!
    var concessionairePercentage : String!
    var concessionairePrice : Int!
    var deliveredAt : String!
    var deliveryCharge : Int!
    var deliveryNotes : String!
    var deliveryPercentage : String!
    var dishList : [DishList]!
    var distance : Int!
    var dropoffAddress : String!
    var dropoffLatitude : String!
    var dropoffLongitude : String!
    var estimatedTime : String!
    var id : Int!
    var insertdate : String!
    var isDriverSettled : String!
    var isVendorSettled : Int!
    var notes : String!
    var orderDatetime : String!
    var orderId : String!
    var paymentMethod : String!
    var paymentStatus : String!
    var pickupAddress : String!
    var pickupLatitude : String!
    var pickupLongitude : String!
    var preparedAt : String!
    var preprationTime : String!
    var readyAt : String!
    var rejectReason : String!
    var rejectedAt : String!
    var rejectedBy : String!
    var runnerCommission : Int!
    var runnerCountryCode : String!
    var runnerId : Int!
    var runnerImage : String!
    var runnerLatitude : String!
    var runnerLongitude : String!
    var runnerMobileNumber : String!
    var runnerName : String!
    var salesTax : Int!
    var seatId : Int!
    var seatNumber : String!
    var serviceTax : Int!
    var splittingRatio : String!
    var stadiumId : Int!
    var status : String!
    var subtotal : Int!
    var taxPercentage : Int!
    var tip : Int!
    var totalAmount : Int!
    var totalItems : Int!
    var transactionId : String!
    var updatetime : String!
    var userId : String!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    required init(fromJson json: JSON) {
        if json.isEmpty{
            return
    }
    
        acceptedAt = json["accepted_at"].stringValue
        adminCommission = json["admin_commission"].intValue
        cancelBy = json["cancel_by"].stringValue
        cancelReason = json["cancel_reason"].stringValue
        cancelledAt = json["cancelled_at"].stringValue
        cardId = json["card_id"].intValue
        completedAt = json["completed_at"].stringValue
        completedbyConcessionaire = json["completedby_concessionaire"].stringValue
        concessionaireCommission = json["concessionaire_commission"].intValue
        concessionaireId = json["concessionaire_id"].intValue
        concessionaireLogo = json["concessionaire_logo"].stringValue
        concessionaireName = json["concessionaire_name"].stringValue
        concessionairePercentage = json["concessionaire_percentage"].stringValue
        concessionairePrice = json["concessionaire_price"].intValue
        deliveredAt = json["delivered_at"].stringValue
        deliveryCharge = json["delivery_charge"].intValue
        deliveryNotes = json["delivery_notes"].stringValue
        deliveryPercentage = json["delivery_percentage"].stringValue
        dishList = [DishList]()
        let dishListArray = json["dish_list"].arrayValue
        for dishListJson in dishListArray{
            let value = DishList(fromJson: dishListJson)
            dishList.append(value)
        }
        distance = json["distance"].intValue
        dropoffAddress = json["dropoff_address"].stringValue
        dropoffLatitude = json["dropoff_latitude"].stringValue
        dropoffLongitude = json["dropoff_longitude"].stringValue
        estimatedTime = json["estimated_time"].stringValue
        id = json["id"].intValue
        insertdate = json["insertdate"].stringValue
        isDriverSettled = json["is_driver_settled"].stringValue
        isVendorSettled = json["is_vendor_settled"].intValue
        notes = json["notes"].stringValue
        orderDatetime = json["order_datetime"].stringValue
        orderId = json["order_id"].stringValue
        paymentMethod = json["payment_method"].stringValue
        paymentStatus = json["payment_status"].stringValue
        pickupAddress = json["pickup_address"].stringValue
        pickupLatitude = json["pickup_latitude"].stringValue
        pickupLongitude = json["pickup_longitude"].stringValue
        preparedAt = json["prepared_at"].stringValue
        preprationTime = json["prepration_time"].stringValue
        readyAt = json["ready_at"].stringValue
        rejectReason = json["reject_reason"].stringValue
        rejectedAt = json["rejected_at"].stringValue
        rejectedBy = json["rejected_by"].stringValue
        runnerCommission = json["runner_commission"].intValue
        runnerCountryCode = json["runner_country_code"].stringValue
        runnerId = json["runner_id"].intValue
        runnerImage = json["runner_image"].stringValue
        runnerLatitude = json["runner_latitude"].stringValue
        runnerLongitude = json["runner_longitude"].stringValue
        runnerMobileNumber = json["runner_mobile_number"].stringValue
        runnerName = json["runner_name"].stringValue
        salesTax = json["sales_tax"].intValue
        seatId = json["seat_id"].intValue
        seatNumber = json["seat_number"].stringValue
        serviceTax = json["service_tax"].intValue
        splittingRatio = json["splitting_ratio"].stringValue
        stadiumId = json["stadium_id"].intValue
        status = json["status"].stringValue
        subtotal = json["subtotal"].intValue
        taxPercentage = json["tax_percentage"].intValue
        tip = json["tip"].intValue
        totalAmount = json["total_amount"].intValue
        totalItems = json["total_items"].intValue
        transactionId = json["transaction_id"].stringValue
        updatetime = json["updatetime"].stringValue
        userId = json["user_id"].stringValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if acceptedAt != nil{
            dictionary["accepted_at"] = acceptedAt
        }
        if adminCommission != nil{
            dictionary["admin_commission"] = adminCommission
        }
        if cancelBy != nil{
            dictionary["cancel_by"] = cancelBy
        }
        if cancelReason != nil{
            dictionary["cancel_reason"] = cancelReason
        }
        if cancelledAt != nil{
            dictionary["cancelled_at"] = cancelledAt
        }
        if cardId != nil{
            dictionary["card_id"] = cardId
        }
        if completedAt != nil{
            dictionary["completed_at"] = completedAt
        }
        if completedbyConcessionaire != nil{
            dictionary["completedby_concessionaire"] = completedbyConcessionaire
        }
        if concessionaireCommission != nil{
            dictionary["concessionaire_commission"] = concessionaireCommission
        }
        if concessionaireId != nil{
            dictionary["concessionaire_id"] = concessionaireId
        }
        if concessionaireLogo != nil{
            dictionary["concessionaire_logo"] = concessionaireLogo
        }
        if concessionaireName != nil{
            dictionary["concessionaire_name"] = concessionaireName
        }
        if concessionairePercentage != nil{
            dictionary["concessionaire_percentage"] = concessionairePercentage
        }
        if concessionairePrice != nil{
            dictionary["concessionaire_price"] = concessionairePrice
        }
        if deliveredAt != nil{
            dictionary["delivered_at"] = deliveredAt
        }
        if deliveryCharge != nil{
            dictionary["delivery_charge"] = deliveryCharge
        }
        if deliveryNotes != nil{
            dictionary["delivery_notes"] = deliveryNotes
        }
        if deliveryPercentage != nil{
            dictionary["delivery_percentage"] = deliveryPercentage
        }
        if dishList != nil{
            var dictionaryElements = [[String:Any]]()
            for dishListElement in dishList {
                dictionaryElements.append(dishListElement.toDictionary())
            }
            dictionary["dish_list"] = dictionaryElements
        }
        if distance != nil{
            dictionary["distance"] = distance
        }
        if dropoffAddress != nil{
            dictionary["dropoff_address"] = dropoffAddress
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
        if insertdate != nil{
            dictionary["insertdate"] = insertdate
        }
        if isDriverSettled != nil{
            dictionary["is_driver_settled"] = isDriverSettled
        }
        if isVendorSettled != nil{
            dictionary["is_vendor_settled"] = isVendorSettled
        }
        if notes != nil{
            dictionary["notes"] = notes
        }
        if orderDatetime != nil{
            dictionary["order_datetime"] = orderDatetime
        }
        if orderId != nil{
            dictionary["order_id"] = orderId
        }
        if paymentMethod != nil{
            dictionary["payment_method"] = paymentMethod
        }
        if paymentStatus != nil{
            dictionary["payment_status"] = paymentStatus
        }
        if pickupAddress != nil{
            dictionary["pickup_address"] = pickupAddress
        }
        if pickupLatitude != nil{
            dictionary["pickup_latitude"] = pickupLatitude
        }
        if pickupLongitude != nil{
            dictionary["pickup_longitude"] = pickupLongitude
        }
        if preparedAt != nil{
            dictionary["prepared_at"] = preparedAt
        }
        if preprationTime != nil{
            dictionary["prepration_time"] = preprationTime
        }
        if readyAt != nil{
            dictionary["ready_at"] = readyAt
        }
        if rejectReason != nil{
            dictionary["reject_reason"] = rejectReason
        }
        if rejectedAt != nil{
            dictionary["rejected_at"] = rejectedAt
        }
        if rejectedBy != nil{
            dictionary["rejected_by"] = rejectedBy
        }
        if runnerCommission != nil{
            dictionary["runner_commission"] = runnerCommission
        }
        if runnerCountryCode != nil{
            dictionary["runner_country_code"] = runnerCountryCode
        }
        if runnerId != nil{
            dictionary["runner_id"] = runnerId
        }
        if runnerImage != nil{
            dictionary["runner_image"] = runnerImage
        }
        if runnerLatitude != nil{
            dictionary["runner_latitude"] = runnerLatitude
        }
        if runnerLongitude != nil{
            dictionary["runner_longitude"] = runnerLongitude
        }
        if runnerMobileNumber != nil{
            dictionary["runner_mobile_number"] = runnerMobileNumber
        }
        if runnerName != nil{
            dictionary["runner_name"] = runnerName
        }
        if salesTax != nil{
            dictionary["sales_tax"] = salesTax
        }
        if seatId != nil{
            dictionary["seat_id"] = seatId
        }
        if seatNumber != nil{
            dictionary["seat_number"] = seatNumber
        }
        if serviceTax != nil{
            dictionary["service_tax"] = serviceTax
        }
        if splittingRatio != nil{
            dictionary["splitting_ratio"] = splittingRatio
        }
        if stadiumId != nil{
            dictionary["stadium_id"] = stadiumId
        }
        if status != nil{
            dictionary["status"] = status
        }
        if subtotal != nil{
            dictionary["subtotal"] = subtotal
        }
        if taxPercentage != nil{
            dictionary["tax_percentage"] = taxPercentage
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
        if transactionId != nil{
            dictionary["transaction_id"] = transactionId
        }
        if updatetime != nil{
            dictionary["updatetime"] = updatetime
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        return dictionary
    }
}

class DishList : Mappable{
  
    

    var categoryId : Int!
    var categoryName : String!
    var dishId : Int!
    var dishImage : String!
    var id : Int!
    var name : String!
    var price : Int!
    var qty : Int!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    required init(fromJson json: JSON) {
        if json.isEmpty{
            return
    }

        categoryId = json["category_id"].intValue
        categoryName = json["category_name"].stringValue
        dishId = json["dish_id"].intValue
        dishImage = json["dish_image"].stringValue
        id = json["id"].intValue
        name = json["name"].stringValue
        price = json["price"].intValue
        qty = json["qty"].intValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if categoryId != nil{
            dictionary["category_id"] = categoryId
        }
        if categoryName != nil{
            dictionary["category_name"] = categoryName
        }
        if dishId != nil{
            dictionary["dish_id"] = dishId
        }
        if dishImage != nil{
            dictionary["dish_image"] = dishImage
        }
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if price != nil{
            dictionary["price"] = price
        }
        if qty != nil{
            dictionary["qty"] = qty
        }
        return dictionary
    }
}
