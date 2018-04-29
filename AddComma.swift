// 
//  AddComma.swift
//  
//
//  Created by Yuta S. on H30/04/28.
//  Copyright © 平成30年 Yuta S. All rights reserved.
//
//

import Foundation

class AddComma {
    func addComma(values: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        formatter.string(from: values as NSNumber)
        let valuesText = formatter.string(from: values as NSNumber)
        return valuesText ?? "0"
    }
}
