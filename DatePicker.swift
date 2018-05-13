//
//  DatePicker.swift
//
//
//  Created by Yuta S. on 2018/05/02.
//  Copyright © 2018年 Yuta S. All rights reserved.
//

import UIKit

class ProfileDatePicker: UIDatePicker {
    /// デートピッカーのハンドラ
    var mOnDidChangeDateHandler: ((UIDatePicker) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setInit(defaultDate: nil)
    }
    
    convenience init(defaultDate: Date?, onDidChangeDateHandler: ((UIDatePicker) -> Void)?) {
        self.init()
        self.setInit(defaultDate: defaultDate)
        self.mOnDidChangeDateHandler = onDidChangeDateHandler
    }
    
    /// 初期化
    ///
    /// - Parameter defaultDate: 初期値
    private func setInit(defaultDate: Date?) {
        Debug.log()
        self.locale = Locale(identifier: "ja_JP")
        self.calendar = Calendar(identifier: .gregorian)
        self.datePickerMode = .date
        self.date = defaultDate ?? Date()
        self.minimumDate = DateUtil().toDateI(from: "19000101", style: .yyyyMMdd)
        self.maximumDate = Date()
        self.addTarget(self, action: #selector(self.onDidChangeDate(sender:)), for: .valueChanged)
    }
    
    // デートピッカーのハンドラ
    @objc internal func onDidChangeDate(sender: UIDatePicker) {
        Debug.log()
        if let handler = mOnDidChangeDateHandler { handler(sender) }
    }
}
