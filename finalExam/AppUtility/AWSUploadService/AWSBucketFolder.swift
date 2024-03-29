//
//  AWSBucketFolder.swift
//  MVVMBasicStructure
//
//  Created by KISHAN_RAJA on 21/04/21.
//

import Foundation

/// This enum contain all the folder name inside the bucket.
enum AWSBucketFolder {
    
    case profileImage
    case videoPath
    case thumb
    
    private var folderName: String {
        switch self {
        case .profileImage:
            return "profile_image"
            
        case .videoPath:
            return "video"
            
        case .thumb:
            return "thumb"
        }
    }
    
    var path: String {
        "\(AWSUploadConfigration.bucket.rawValue)/\(self.folderName)/"
    }
}
