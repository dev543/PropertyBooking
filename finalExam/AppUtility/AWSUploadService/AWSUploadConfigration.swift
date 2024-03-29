//
//  AWSUploadConfigration.swift
//  MVVMBasicStructure
//
//  Created by KISHAN_RAJA on 21/04/21.
//

import Foundation
import AWSCore
import AWSS3

/// This enum contain all the keys and configration of AWS account.
enum AWSUploadConfigration: String {
    
    case bucket = "bucket-name"
    case accessKeyID = "accessKeyID"
    case secretKey = "secretKey"
    case basePath = "https://bucket-name.s3.us-east-2.amazonaws.com/"
    
    static var regionType: AWSRegionType {
        .USEast2
    }
}
