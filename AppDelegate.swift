//
//  AppDelegate.swift
//  CocoaPodsDemo
//
//  Created by SN on 15/4/21.
//  Copyright (c) 2015年 maiziedu. All rights reserved.
//

import UIKit
import KGFloatingDrawer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private struct Constants {
        static let DrawersStoryboardName = "Main"
        static let DrawerLeftViewControllerStoryboardId = "LeftViewControllerStoryboardId"
        static let DrawerRightViewControllerStoryboardId = "RightViewControllerStoryboardId"
        static let DrawerCenterViewControllerStoryboardId = "CenterViewControllerStoryboardId"
    }
    
    var window: UIWindow?
    var _drawerViewController:KGDrawerViewController?
    var drawerViewController:KGDrawerViewController{
        if let viewControll = _drawerViewController{
            return viewControll
        }
        return prepareForDrawerViewController()
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        window?.rootViewController = drawerViewController
        
        window?.makeKeyAndVisible()

        return true
    }

    func prepareForDrawerViewController()->KGDrawerViewController{
        let drawerViewController = KGDrawerViewController()
        
        drawerViewController.centerViewController = centerViewController()
        drawerViewController.leftViewController = leftViewController()
        drawerViewController.rightViewController = rightViewController()
        drawerViewController.backgroundImage = UIImage(named: "sky")
        
        _drawerViewController = drawerViewController
        
        return drawerViewController
    }
    
   
    private func drawerStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: Constants.DrawersStoryboardName, bundle: nil)
        return storyboard
    }

    private func viewControllerForStoryboardId(storyboardId: String) -> UIViewController {
        let viewController: UIViewController = drawerStoryboard().instantiateViewControllerWithIdentifier(storyboardId) as! UIViewController
        return viewController
    }
    
    private func centerViewController() -> UIViewController {
        let viewController = viewControllerForStoryboardId(Constants.DrawerCenterViewControllerStoryboardId)
        return viewController
    }
    
    private func leftViewController() -> UIViewController {
        let viewController = viewControllerForStoryboardId(Constants.DrawerLeftViewControllerStoryboardId)
        return viewController
    }
    
    private func rightViewController() -> UIViewController {
        let viewController = viewControllerForStoryboardId(Constants.DrawerRightViewControllerStoryboardId)
        return viewController
    }
    

    func toggleLeftDrawer(sender:AnyObject, animated:Bool) {
        _drawerViewController?.toggleDrawer(.Left, animated: true, complete: { (finished) -> Void in
            // do nothing
        })
    }
    
    func toggleRightDrawer(sender:AnyObject, animated:Bool) {
        _drawerViewController?.toggleDrawer(.Right, animated: true, complete: { (finished) -> Void in
            // do nothing
        })
    }

   
}

