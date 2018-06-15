//
//  AppDelegate.swift
//  xinde
//
//  Created by 李力 on 2017/8/17.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import CoreData
import AVOSCloud
import LeanCloud
import UserNotifications
import LeanCloudSocial
import AVOSCloud.AVSearchQuery
//import LeanCloudSocial.AVUser_SNS
//import AVOSCloudSNS
//import AVOSCloudSNS.AVUser_SNS
extension UIWindow {
    // 获取当前活动的控制器
    public var visibleViewController:UIViewController? {
        return UIWindow.getVisibleViewControllerFrom(vc: self.rootViewController)
    }
    
    public static func getVisibleViewControllerFrom(vc:UIViewController?) -> UIViewController? {
        if let nc = vc as? UINavigationController {
            return UIWindow.getVisibleViewControllerFrom(vc: nc.visibleViewController)
        } else if let tc = vc as? UITabBarController {
            return UIWindow.getVisibleViewControllerFrom(vc: tc.selectedViewController)
        } else {
            if let pvc = vc?.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(vc: pvc)
            } else {
                return vc
            }
        }
    }
}

@UIApplicationMain
class AppDelegate: UIResponder,UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let homeIcon = UIApplicationShortcutIcon(type: .compose)
        let homeItem = UIApplicationShortcutItem(type: "homeAnchor", localizedTitle: "首页", localizedSubtitle: "点击进入首页", icon: homeIcon, userInfo: nil)
        let playIcon = UIApplicationShortcutIcon(type: .play)
        let playItem = UIApplicationShortcutItem(type: "play", localizedTitle: "播放", localizedSubtitle: "", icon: playIcon, userInfo: nil)
        let userIcon = UIApplicationShortcutIcon(type: .search)
        let userItem = UIApplicationShortcutItem(type: "username", localizedTitle: "用户名", localizedSubtitle: "", icon: userIcon, userInfo: nil)
        
        UIApplication.shared.shortcutItems = [homeItem, playItem, userItem]
        
        
        
        
        AVOSCloud.setApplicationId("pIaW5DPdhbEqv5NBz200eaug-gzGzoHsz",clientKey:"uMmeecfPC3avE6oYAunpBaJ0")
//
        
//        AVOSCloud.setApplicationId("I5Axz48F9cKKcCzgrlxEMkiO-gzGzoHsz",clientKey:"Pw3nDNDSGEheaqQxPb6zWESM")

//        AVOSCloud.setAllLogsEnabled(true)
        
        return true
        
//        AVOSCloud.setApplicationId("pIaW5DPdhbEqv5NBz200eaug-gzGzoHsz", clientKey: "uMmeecfPC3avE6oYAunpBaJ0")
//
//        AVOSCloudSNS.setupPlatform(AVOSCloudSNSType.snsSinaWeibo, withAppKey: "3115188270", andAppSecret: "3c046f7fcea271f5efde83532070f8fc", andRedirectURI: "https://leancloud.cn/1.1/sns/callback/j1hmpbkeoqjnodfd")
//
//        LeanCloud.initialize(applicationID: "pIaW5DPdhbEqv5NBz200eaug-gzGzoHsz", applicationKey: "uMmeecfPC3avE6oYAunpBaJ0")
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {
            (granted,error) in
            if granted{
                print("用户同意")
            }else{
                print("用户不同意")
            }
        })
        
        
        
        
        return true
    }
    
//    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
//
//        switch shortcutItem.type {
//        case "play":
//            let items = ["hello 3D Touch"]
//            let activityVC = UIActivityViewController(
//                activityItems: items,
//                applicationActivities: nil)
//            self.window?.rootViewController?.present(activityVC, animated: true, completion: { () -> Void in
//
//
//
//            })
//        default:
//            break
//        }
//    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        switch shortcutItem.type {
        case "play":
            
//            window?.rootViewController = UIViewController()
            
//            self.window?.rootViewController?.presentedViewController(AddAreaTableViewController(), animated: true, completion: nil)
//rootViewController.selectedViewController
//            self.window?.rootViewController?.childViewControllers[0]
//            UserLoginViewController *login = [[UserLoginViewControlleralloc] init];
            let login = MyTableViewController()
                        
            self.window?.rootViewController?.childViewControllers[0]

//            window?.rootViewController?.present(MyTableViewController(), animated: true, completion: nil)
//
//            let ccc = AddAreaTableViewController()
//
//            self.window?.rootViewController?.present(ccc, animated: true, completion: nil)
////
////            window?.rootViewController?.present(ccc, animated: true, completion: nil)
//        default:break

        default:break
            print("66")
        }
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
//    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
//        return AVOSCloudSNS.handleOpen(url)
//    }
//
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {

        let ccc = URL(string: "https://piaw5dpd.api.lncld.net/1.1/go/com.leancloud.pIaW5DPdhbEqv5NBz200eaug-gzGzoHsz/classes/cs/5acc517b9f54542bb236f791")?.lastPathComponent
        
        let todo = AVObject(className: "cs")
        
//        ccc = true
//        ccc = todo.objectId
        
//        todo.objectId = ccc
        
        todo.fetchInBackground{ (results,error) in
            let results = results
            
            print(results as Any,"nihewo")
            
        }
        
    
        //        return yes
//        return true
        
   
        return AVOSCloudSNS.handleOpen(url)
    }
//
//    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
//        return AVOSCloudSNS.handleOpen(url)
//    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "xinde")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

