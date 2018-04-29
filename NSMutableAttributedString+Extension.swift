//
//  NSMutableAttributedString+Extension.swift
//
//
//  Created by Yuta S. on 2018/04/09.
//  Copyright © 2018年 Yuta S. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    /// 画像文字作成
    ///
    /// - Parameters:
    ///   - string: 文字列
    ///   - imageList: 画像とindex
    ///   - point: ポイント
    convenience init(string: String, imageList: [(image: UIImage, index: Int)], point: CGPoint = CGPoint.zero) {
        self.init(string: string)
        for image in imageList {
            let textAttachment = NSTextAttachment()
            textAttachment.image = image.image
            textAttachment.bounds = CGRect(origin: point, size: image.image.size)
            let ns = NSAttributedString(attachment: textAttachment)
            self.insert(ns, at: image.index)
        }
    }
}
