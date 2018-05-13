//
//  Date+Extension.swift
//  
//
//  Created by Yuta S. on 2018/03/29.
//  Copyright © 2018年 Yuta S. All rights reserved.
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
    /// １時間前
    var oneHourAgo: Date {
        return Calendar.current.date(byAdding: .hour, value: -1, to: self)!
    }
    /// 今日
    var jpnDate: Date {
        return Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: self)!
    }
    /// 月曜日
    var lastMonday: Date {
        let calendar = Calendar.current
        if calendar.dateComponents([.weekday], from: self).weekday == 2 {
            return self
        }
        let lastWeek = calendar.date(byAdding: .day, value: -7, to: self)
        return Calendar.current.date(bySetting: .weekday, value: 2, of: lastWeek!)!
    }
    /// 月初
    var firstDayOfMonth: Date {
        let calendar = Calendar.current
        let comps = calendar.dateComponents([.year, .month], from: self)
        return calendar.date(from: comps)!
    }
    /// その月が何日あるか
    var dayCountOfMonth: Int {
        let range = Calendar.current.range(of: .day, in: .month, for: self)
        
        return range!.upperBound - 1
    }
    /// その月が何日あるか
    var day: Int {
        return Calendar.current.dateComponents([.day], from: self).day!
    }
    /// １カ月前
    var oneMonthAgo: Date {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)!
    }
}
