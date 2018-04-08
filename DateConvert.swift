//
//  DateConvert.swift
//  DateConvert
//
//  Created by Yuta.S on 2018/03/28.
//  Copyright © 2018年 Yuta.S All rights reserved.
//

import UIKit

/// 日付の変換
class DateUtil {
    
    /// 日付のスタイル
    ///
    /// - yyyyMMdd: yyyyMMdd
    /// - yyyyMMddJP: yyyy年MM月dd日
    enum DateStyle {
        /// yyyyMMdd
        case yyyyMMdd
        /// yyyy/MM/dd
        case yyyyMMddSlash
        /// yyyy/MM/dd HH:mm:ss.sss
        case yyyyMMddHHmmssSss
        /// yyyy年MM月dd日
        case yyyyMMddJP
        
        /// 日付スタイルを文字列で返す
        ///
        /// - Returns: 文字列
        internal func setFromatI() -> String {
            switch self {
            case .yyyyMMdd:
                return "yyyyMMdd"
            case .yyyyMMddSlash:
                return "yyyy/MM/dd"
            case .yyyyMMddHHmmssSss:
                return "yyyy/MM/dd HH:mm:ss.sss"
            case .yyyyMMddJP:
                return "yyyy年MM月dd日"
            }
        }
    }
    
    // MARK: - Internal Methods
    /// String を Date に変換するメソッド
    ///
    /// * 失敗した場合は現在時刻を返す（デバックビルド時は落ちる）
    ///
    /// - Parameters:
    ///   - string: 変換したい文字列
    ///   - style: 日付のスタイル
    /// - Returns: 変換後の値（Date）
    internal func toDateI(from string: String, style: DateStyle) -> Date {
        let dateFomatter = DateFormatter()
        dateFomatter.locale = Locale(identifier: "ja_JP")
        dateFomatter.calendar = Calendar(identifier: .gregorian)
        dateFomatter.dateFormat = style.setFromatI()
        guard let date = dateFomatter.date(from: string) else {
            assertionFailure("Date変換エラー")
            return Date()
        }
        return date
    }
    
    /// Date を String に変換するメソッド
    ///
    /// - Parameters:
    ///   - date: 変換したいDate型
    ///   - style: 日付のスタイル
    /// - Returns: 変換後の値（文字列）
    internal func toStringI(from date: Date?, style: DateStyle) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat  = style.setFromatI()
        guard let dataValue = date else { return "" }
        return dateFormatter.string(from: dataValue)
    }
    
    /// 日数の差分を取得する処理
    ///
    /// - Parameters:
    ///   - startDate: 開始日
    ///   - endDate: 終了日
    /// - Returns: 日数差分（一日単位）
    internal func timeIntervalI(startDate: Date, endDate: Date) -> Int {
        let span = endDate.timeIntervalSince(startDate)
        let between = Int(span/60/60/24)
        
        return between
    }
}
