//
//  AqarakApp.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI

import GoogleMaps
import GooglePlaces
@main
struct AqarakApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
      
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
   
    
    let gcmMessageIDKey = "gcm.message_id"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        requestPermission()
        // Override point for customization after application launch.
        GMSServices.provideAPIKey("AIzaSyBApEGRGZKAVt2_b3U7Yur7qccgnCLjsf0")
        GMSPlacesClient.provideAPIKey("AIzaSyBApEGRGZKAVt2_b3U7Yur7qccgnCLjsf0")
        
       
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
        return true
    }
    func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
        return true
    }
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // fetch data from internet now
//        SignalRService(url:  URL(string: "\(AppBase)/NotificationHub?UserID=\(VarUserDefault.SysGlobalData.getGlobalInt(key:VarUserDefault.SysGlobalData.userId))&PhoneNo=\(VarUserDefault.SysGlobalData.getGlobal(key: VarUserDefault.SysGlobalData.mobileNo))&TypeID=1")!)
    }
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func requestPermission() -> Void {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.sound, .badge, .alert]) { granted, error in
                if granted == true && error == nil {
                    
                }
        }
    }
 
}
