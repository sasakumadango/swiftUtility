//
//  RawRepresentable+Extension.swift
//  
//
//  Created by Yuta S. on 2018/03/22.
//  Copyright © 2018年 Yuta S. All rights reserved.
//

import Foundation

extension RawRepresentable {
    /// enum(String)のrowValueを返す
    ///
    ///     // 使用例
    ///     typealias A = RealmDefaultValues.Data
    ///     let values: String = A.set(A.isWelcomeShown)
    ///
    /// - Parameter key: 要素
    /// - Returns: 文字列
    static internal func set<T: RawRepresentable>(_ key: T) -> String {
        return key.rawValue as! String
    }
}
