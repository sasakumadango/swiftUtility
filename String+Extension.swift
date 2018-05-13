//
//  String+Extension.swift
//  
//
//  Created by Yuta S. on 2018/03/05.
//  Copyright © 2018年 Yuta S. All rights reserved.
//

import UIKit

extension String {
    /// `Localizable.strings` で定義された文言を呼びだす
    ///
    /// ## 呼び出し方
    ///
    /// 1. 変数がない場合は `key.localizable()` で呼び出す
    ///
    /// 1. 変数がある場合は `key.localizable(dynamicString: "代入する値")で呼び出す`
    ///
    ///         ex1) // Localizable.strings
    ///              "mikeko" = "三毛子";
    ///
    ///              // 呼び出し元クラス
    ///              "mikeko".localizable() // "三毛子"
    ///
    ///         ex2) // Localizable.strings
    ///              "name" = "私は%@です。";
    ///
    ///              // 呼び出し元クラス
    ///              "name".localizable(dynamicString1: "太郎") // "私は太郎です。"
    ///
    ///         ex3) // Localizable.strings
    ///              "name" = "私は%@です。\n%@です。";
    ///
    ///              // 呼び出し元クラス
    ///              "name".localizable(dynamicString1: "太郎", dynamicString2: "プログラマ") // 私は太郎です。
    ///                                                                                       プログラマです。
    /// - Parameter
    ///   - dynamicString1: 呼び出し元に可変の変数がある場合はこちらを指定する。
    ///   - dynamicString2: 呼び出し元に可変の変数が二個ある場合はこちらも指定する。
    /// - Returns: 呼び出される文字列
    internal func localizable(dynamicString1: String = "", dynamicString2: String = "") -> String {
        return String(format: NSLocalizedString(self, comment: ""), dynamicString1, dynamicString2)
    }
    
    /// 半角数字のみか調べ、半角数字以外は取り除く。
    ///
    ///      ex) 文字列： "01あ23k45" → "012345"
    ///          文字列： "9123" → "9123"
    mutating internal func checkOnlyNumberAndRemoveElse() {
        /// 正規表現（半角数字ではない）
        let notNumberPattern = "^(?!.*[0-9]).*$"
        // 半角数字でない文字が入っていたらそれを取り除く
        var tmp = ""
        self.forEach { character in
            let string = String(character)
            string.range(of: notNumberPattern, options: .regularExpression, range: string.range(of: string), locale: .current) != nil ? tmp.append("") : tmp.append(character)
        }
        self = tmp
    }
}
