//
//  UIImage+color.swift
//  MarvelApiChallenge
//
//  Created by Gabriel Policastro on 25/03/23.
//

import UIKit

extension UIImage {
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
