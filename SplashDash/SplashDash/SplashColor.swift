//
//  SplashColor.swift
//  SplashDash
//
//  Created by Sabrina Ip on 3/1/17.
//  Copyright © 2017 SHT. All rights reserved.
//

import UIKit

extension UIColor {
    // Adopted from: http://crunchybagel.com/working-with-hex-colors-in-swift-3/
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff,
            alpha: alpha
        )
    }
}

struct SplashColor {
    static let colorsDict = [
//        "darkPrimaryColor" : "7190d9",
//        "primaryColor" : "d97181",
//        "lightPrimaryColor" : "d9d071",
        "darkPrimaryColor" : "cc8975",
        "primaryColor" : "9d75cc",
        "lightPrimaryColor" : "a3cc75",
        "primaryTextColor" : "FFFFFF",
        "secondaryTextColor" : "727272",
    ]
    
    static func darkPrimaryColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hex: self.colorsDict["darkPrimaryColor"]!, alpha: alpha)
    }
    static func primaryColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hex: self.colorsDict["primaryColor"]!, alpha: alpha)
    }
    static func lightPrimaryColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hex: self.colorsDict["lightPrimaryColor"]!, alpha: alpha)
    }
    static func primaryTextColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hex: self.colorsDict["primaryTextColor"]!, alpha: alpha)
    }
    static func secondaryTextColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hex: self.colorsDict["secondaryTextColor"]!, alpha: alpha)
    }
}
