//
//  AppDelegate.swift
//  OrinetationApp
//
//  Created by Yogendra Tandel on 30/12/18.
//  Copyright © 2018 Yogendra Tandel. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var didRotate: (Notification) -> Void = { notification in
        switch UIDevice.current.orientation {
        case .landscapeLeft, .landscapeRight:
            print("landscape")
        case .portrait, .portraitUpsideDown:
            print("Portrait")
        default:
            print("other")
        }
    }



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification,
                                               object: nil,
                                               queue: .main,
                                               using: didRotate)


        return true
    }

}


