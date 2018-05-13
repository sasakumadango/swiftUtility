//
//  DateUtil.swift
//  
//
//  Created by Yuta S. on 2018/02/09.
//  Copyright © 2018年 Yuta S. All rights reserved.
//

import UIKit

/// 日付の変換
class DateUtil {
    
    /// 日付のスタイル
    ///
    /// - yyyyMMdd: yyyyMMdd
    /// - yyyyMMddJP: yyyy年MM月dd日
    enum DateStyle {
        /// yyyy/MM
        case yyyyMMSlash
        /// yyyyMMdd
        case yyyyMMdd
        /// yyyy/MM/dd
        case yyyyMMddSlash
        /// yyyy/MM/dd HH:mm:ss.sss
        case yyyyMMddHHmmssSss
        /// yyyy/MM/dd HH:mm:ss
        case yyyyMMddHHmmss
        /// yyyy年MM月dd日
        case yyyyMMddJP
        /// HH:mm
        case HHmm
        /// HH:mm:ss
        case HHmmss
        /// yyyy/MM/dd HH:mm
        case yyyyMMddHHmm
        /// MM月dd日
        case MMddJP
        /// 日付スタイルを文字列で返す
        ///
        /// - Returns: 文字列
        internal func setFromatI() -> String {
            switch self {
            case .yyyyMMSlash:
                return "yyyy/MM"
            case .yyyyMMdd:
                return "yyyyMMdd"
            case .yyyyMMddSlash:
                return "yyyy/MM/dd"
            case .yyyyMMddHHmmssSss:
                return "yyyy/MM/dd HH:mm:ss.sss"
            case .yyyyMMddHHmmss:
                return "yyyy/MM/dd HH:mm:ss"
            case .yyyyMMddJP:
                return "yyyy年MM月dd日"
            case .HHmm:
                return "HH:mm"
            case .HHmmss:
                return "HH:mm:ss"
            case .yyyyMMddHHmm:
                return "yyyy/MM/dd HH:mm"
            case .MMddJP:
                return "MM月dd日"
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
    internal func toDateI(from string: String, style: DateStyle, locale: Locale = Locale(identifier: "ja_JP"), timeZone: TimeZone! = TimeZone(identifier: "Asia/Tokyo")) -> Date {
        let dateFomatter = DateFormatter()
        dateFomatter.locale = locale
        dateFomatter.timeZone = timeZone
        dateFomatter.calendar = Calendar(identifier: .gregorian)
        dateFomatter.dateFormat = style.setFromatI()
        guard let date = dateFomatter.date(from: string) else {
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
    internal func toStringI(from date: Date?, style: DateStyle, locale: Locale = Locale(identifier: "ja_JP"), timeZone: TimeZone! = TimeZone(identifier: "Asia/Tokyo")) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.timeZone = timeZone
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
    
    /// DateのHH:mm:ssを0にセットしたDateを返す
    ///
    /// - Parameters:
    ///   - date: 基準とするDate
    ///   - timezone: 変換後の基準とするTimeZone
    /// - Returns: 引数のHH:mm:ssを0にセットしたDate
    internal func convertToYYYYMMDD(from date: Date, timezone: TimeZone = TimeZone(identifier: "UTC")!) -> Date {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = timezone
        guard let convetedDate: Date = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: date) else {
            assertionFailure("Date変換エラー")
            return Date()
        }
        return convetedDate
    }
    
    /// N日前を取得
    ///
    /// - Parameters:
    ///   - date: 基準日
    ///   - n: n日前のn
    /// - Returns: n日前のデータ
    internal func getNDaysBefore(date: Date, n: Int ) -> Date? {
        let nDaysBefore = Calendar.current.date(byAdding: .day, value: -n, to: date)!
        return nDaysBefore
    }
    
}
