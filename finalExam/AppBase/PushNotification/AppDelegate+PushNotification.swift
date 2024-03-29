//
//  AppDelegate+PushNotification.swift
//  MVVMBasicStructure
//
//  Created by KISHAN_RAJA on 28/02/21.
//

import UIKit
import UserNotificationsUI
import UserNotifications

//MARK: - Device Token
extension AppDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.map { String(format: "%02x", $0) }.joined()
        DeviceManager.shared.deviceToken = deviceTokenString
        debugPrint(deviceTokenString)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Device Token Not Found \(error)")
    }
}

//MARK: - Push Notification
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    func registerForNotification() {
        //For device token and push notifications.
        UIApplication.shared.registerForRemoteNotifications()
        
        let center : UNUserNotificationCenter = UNUserNotificationCenter.current()
        center.delegate = self
        
        center.requestAuthorization(options: [.sound , .alert , .badge ], completionHandler: { (granted, error) in
            if ((error != nil)) { UIApplication.shared.registerForRemoteNotifications() }
            else {
                
            }
        })
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert , .badge , .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        self.handlePushNotification(JSON(response.notification.request.content.userInfo))
        
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        self.handlePushNotification(JSON(userInfo))
    }
    
    //------------------------------------------------------
    //TODO : This is custom notification method
    
    private func handlePushNotification(_ userInfo : JSON) {
        print(userInfo)
        
        let _ = JSON(userInfo["tag"]).stringValue
        
    }
}
