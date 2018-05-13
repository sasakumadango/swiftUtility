//
//  JSONDecode+Extension.swift
//  
//
//  Created by Yuta S. on 2018/03/16.
//  Copyright © 2018年 Yuta S. All rights reserved.
//

import Foundation

extension JSONDecoder {
    /// 日付のスタイル
    ///
    /// - yyyyMMdd: yyyyMMdd
    /// - yyyyMMddJP: yyyy年MM月dd日
    enum DateStyle {
        /// yyyyMMdd
        case yyyyMMdd
        /// yyyy/MM/dd
        case yyyyMMddSlash
        /// yyyy/MM/dd HH:mm:ss.SSS
        case yyyyMMddHHmmssSss
        /// yyyy年MM月dd日
        case yyyyMMddJP
        /// yyyy/MM/dd HH:mm:ss
        case yyyyMMddHHmmss
        
        /// 日付スタイルを文字列で返す
        ///
        /// - Returns: 文字列
        func setFromatI() -> String {
            switch self {
            case .yyyyMMdd:
                return "yyyyMMdd"
            case .yyyyMMddSlash:
                return "yyyy/MM/dd"
            case .yyyyMMddHHmmssSss:
                return "yyyy/MM/dd HH:mm:ss.SSS"
            case .yyyyMMddJP:
                return "yyyy年MM月dd日"
            case .yyyyMMddHHmmss:
                return "yyyy/MM/dd HH:mm:ss"
            }
        }
    }
    
    /// Data型もデコードする(パースに失敗した場合エラーを投げます)
    ///
    ///     // 呼び出し方例
    ///     let entity = JSONDecoder().decodeExtend(decode: HealthConsultingDataApiEntity.self, json: json)
    ///     // 日付スタイルを変える場合（デフォルトは yyy/MM/dd HH:mm:ss.SSS）
    ///     let entity = JSONDecoder().decodeExtend(decode: HealthConsultingDataApiEntity.self, json: json, style: .yyyyMMdd)
    ///
    /// - Parameters:
    ///   - type: デコードタイプ
    ///   - json: 取得したjsonファイル
    ///   - style: 日付スタイル
    /// - Returns: デコードしたデータ
    func decodeExtend<T: Decodable>(decode type: T.Type, json: Data, style: DateStyle = .yyyyMMddHHmmssSss) throws -> T {
        let formatter = DateFormatter()
        formatter.dateFormat = style.setFromatI()
        formatter.locale = Locale(identifier: "ja_JP")
        let decoder = self
        decoder.dateDecodingStrategy = .formatted(formatter)
        do {
            return try decoder.decode(type.self, from: json)
        } catch let error {
            throw error
        }
    }
}
