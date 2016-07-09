//
//  AppDelegate.swift
//  QRCode
//
//  Created by Wojtek Kozlowski on 09/07/2016.
//  Copyright © 2016 Wojtek Kozlowski. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        return true
    }
    
}

extension NSDateFormatter {
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}

extension String {
    func matches(regex: String) -> [String] {
        let regex = try! NSRegularExpression(pattern: regex, options: [])
        let nsString = self as NSString
        let results = regex.matchesInString(self, options: [], range: NSMakeRange(0, nsString.length))
        return results.map { nsString.substringWithRange($0.range)}
    }
    func firstMatch(regex: String) -> String? {
        return self.matches(regex).first
    }
    func isMatching(regex:String) -> Bool {
        return self.matches(regex).count == 1
    }
}


