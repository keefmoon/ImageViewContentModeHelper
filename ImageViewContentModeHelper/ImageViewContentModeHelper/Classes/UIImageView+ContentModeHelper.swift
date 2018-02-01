//
//  UIImageView+ContentModeHelper.swift
//  ImageViewContentModeHelper
//
//  Created by Keith Moon on 01/02/2018.
//  MIT License
//

import UIKit

extension UIImageView {
    
    public var imageContentFrame: CGRect? {
        return imageContentBounds?.offsetBy(dx: frame.minX, dy: frame.minY)
    }
    
    public var imageContentBounds: CGRect? {
        
        guard let contentSize = image?.size else { return nil }
        
        switch contentMode {
            
        case .scaleToFill:
            return bounds
            
        case .scaleAspectFit:
            var scaledSize: CGSize
            if contentSize.width > contentSize.height {
                let height = (contentSize.height / contentSize.width) * bounds.width
                scaledSize = CGSize(width:bounds.width, height: height)
            } else {
                let width = (contentSize.width / contentSize.height) * bounds.height
                scaledSize = CGSize(width: width, height: bounds.height)
            }
            return CGRect(x: (bounds.width - scaledSize.width)/2, y: (bounds.height - scaledSize.height)/2, width: scaledSize.width, height: scaledSize.height)
            
        case .scaleAspectFill:
            var scaledSize: CGSize
            if contentSize.width < contentSize.height {
                let height = (contentSize.height / contentSize.width) * bounds.width
                scaledSize = CGSize(width:bounds.width, height: height)
            } else {
                let width = (contentSize.width / contentSize.height) * bounds.height
                scaledSize = CGSize(width: width, height: bounds.height)
            }
            return CGRect(x: (bounds.width - scaledSize.width)/2, y: (bounds.height - scaledSize.height)/2, width: scaledSize.width, height: scaledSize.height)
            
        case .redraw:
            return bounds
            
        case .center:
            return CGRect(x: (bounds.width - contentSize.width)/2, y: (bounds.height - contentSize.height)/2, width: contentSize.width, height: contentSize.height)
            
        case .top:
            return CGRect(x: (bounds.width - contentSize.width)/2, y: 0, width: contentSize.width, height: contentSize.height)
            
        case .bottom:
            return CGRect(x: (bounds.width - contentSize.width)/2, y: bounds.height - contentSize.height, width: contentSize.width, height: contentSize.height)
            
        case .left:
            return CGRect(x: 0, y: (bounds.height - contentSize.height)/2, width: contentSize.width, height: contentSize.height)
            
        case .right:
            return CGRect(x: bounds.width - contentSize.width, y: (bounds.height - contentSize.height)/2, width: contentSize.width, height: contentSize.height)
            
        case .topLeft:
            return CGRect(origin: .zero, size: contentSize)
            
        case .topRight:
            return CGRect(x: bounds.width - contentSize.width, y: 0, width: contentSize.width, height: contentSize.height)
            
        case .bottomLeft:
            return CGRect(x: 0, y: bounds.height - contentSize.height, width: contentSize.width, height: contentSize.height)
            
        case .bottomRight:
            return CGRect(x: bounds.width - contentSize.width, y: bounds.height - contentSize.height, width: contentSize.width, height: contentSize.height)
        }
    }
}
