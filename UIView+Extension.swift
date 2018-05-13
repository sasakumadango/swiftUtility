//
//  UIView+Extension.swift
//  
//
//  Created by Yuta S. on 2018/04/01.
//  Copyright © 2018年 Yuta S. All rights reserved.
//

import UIKit

extension UIView {
    
    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue - self.frame.size.height
            self.frame = frame
        }
    }
    
    var right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.origin.x  = newValue - self.frame.size.width
            self.frame = frame
        }
    }
    
    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame       = self.frame
            frame.origin.x  = newValue
            self.frame      = frame
        }
    }
    
    /// UIView を UIImage View に変換する。
    ///
    /// - Returns: UIImage
    func GetImage() -> UIImage {
        // キャプチャする範囲を取得.
        let rect = self.bounds
        // ビットマップ画像のcontextを作成.
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        // 対象のview内の描画をcontextに複写する.
        self.layer.render(in: context)
        // 現在のcontextのビットマップをUIImageとして取得.
        let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        // contextを閉じる.
        UIGraphicsEndImageContext()
        
        return capturedImage
    }
}
