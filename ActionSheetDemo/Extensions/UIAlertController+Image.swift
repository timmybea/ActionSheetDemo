//
//  Extensions.swift
//  ActionSheetDemo
//
//  Created by Tim Beals on 2017-11-18.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    func addImage(image: UIImage) {
        //resize the image
        let maxSize = CGSize(width: self.view.bounds.width - 44, height: 300)
        let imageSize = image.size
        var ratio: CGFloat!

        if imageSize.width > imageSize.height {
            ratio = maxSize.width / imageSize.width
        } else {
            ratio = maxSize.height / imageSize.height
        }
        let scaledSize = CGSize(width: imageSize.width * ratio, height: imageSize.height * ratio)
        var resizedImage = image.imageWithSize(scaledSize)

        //center the image
        if imageSize.height > imageSize.width {
            let left = (maxSize.width - resizedImage.size.width) / 2
            resizedImage = resizedImage.withAlignmentRectInsets(UIEdgeInsetsMake(0, -left, 0, 0))
        }
        
        //add image to the alertController
        let imgAction = UIAlertAction(title: "", style: .default, handler: nil)
        imgAction.isEnabled = false
        imgAction.setValue(resizedImage.withRenderingMode(.alwaysOriginal), forKey: "image")
        self.addAction(imgAction)
    }
}
