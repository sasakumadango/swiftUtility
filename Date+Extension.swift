//
//  Date+Extension.swift
//  
//
//  Created by Yuta.S on 2018/03/29.
//  Copyright © 2018年 Yuta.S. All rights reserved.
//

import Foundation

extension Date {
    /// 午後
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    /// 一昨日
    var dayBeforeYesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -2, to: self)!
    }
    /// 昨日
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    /// 明後日
    var dayAfterTomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 2, to: self)!
    }
    /// 明日
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    /// 今月
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    /// 月末か
    var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
}
