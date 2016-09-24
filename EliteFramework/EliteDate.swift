//
//  EliteDate.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/3/2.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

public extension NSDate {
    
    public var dateByZeroSecond: NSDate {
        return self
    }
    
    public func dateByZeroSecond(date: NSDate) -> NSDate {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
        calendar?.timeZone = .systemTimeZone()
        
        let components = calendar?.components([.Year, .Month, .Day], fromDate: date)
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss.SSS"
        
        let dateString = String(format: "%04d-%02d-%02d 00:00:00.0000", components!.year, components!.month, components!.day)
        
        return dateFormatter.dateFromString(dateString)!
    }
    
    public func cleanNanosecond() -> NSDate {
        
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
        let components = calendar?.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: self)
        
        components?.nanosecond = 0
        
        return calendar?.dateFromComponents(components!) as NSDate!
    }
    
    public func stringFromFormat(format: String) -> String? {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = format
        
        return dateFormatter.stringFromDate(self)
    }
    
    var firstDayByTheYear: NSDate? {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
        let components = calendar?.components([.Year, .Hour, .Minute, .Second], fromDate: self)
        
        components?.month = 1
        components?.day = 1
        components?.nanosecond = 0
        
        return calendar?.dateFromComponents(components!)
    }
    
    var firstDayByTheMonth: NSDate? {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
        let components = calendar?.components([.Year, .Month, .Hour, .Minute, .Second], fromDate: self)
        
        components?.day = 1
        
        return calendar?.dateFromComponents(components!)
    }
    
    var lastDayByTheMonth: NSDate? {
        return self.dateByAddingTimeInterval(Double(daysInTheMonth!) * 24 * 60 * 60)
    }
    
    var daysInTheMonth: Int? {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
        return calendar?.rangeOfUnit(.Day, inUnit: .Month, forDate: self).length
    }
    
    func calendar() -> NSCalendar? {
        return NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
    }
    
    var year:   Int? { return calendar()?.components([.Year],   fromDate: self).day    }
    var month:  Int? { return calendar()?.components([.Month],  fromDate: self).month  }
    var day:    Int? { return calendar()?.components([.Day],    fromDate: self).day    }
    var hour:   Int? { return calendar()?.components([.Hour],   fromDate: self).hour   }
    var minute: Int? { return calendar()?.components([.Minute], fromDate: self).minute }
    var second: Int? { return calendar()?.components([.Second], fromDate: self).second }
    
    var shortweek: String? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.stringFromDate(self)
    }
    
    var longweek: String? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.stringFromDate(self)
    }
}
