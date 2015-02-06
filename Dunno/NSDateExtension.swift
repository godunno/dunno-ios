//
//  NSDateExtension.swift
//  Dunno
//
//  Created by Pedro Nascimento on 1/24/15.
//  Copyright (c) 2015 Pedro Nascimento. All rights reserved.
//

import Foundation

extension NSDate
{
    convenience
    init(dateString:String, formatter: NSDateFormatter = NSDateFormatter()) {
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = formatter.dateFromString(dateString)
        self.init(timeInterval:0, sinceDate:d!)
    }
    
    convenience init(iso8601: String, formatter: NSDateFormatter = NSDateFormatter()) {
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = formatter.dateFromString(iso8601)
        self.init(timeInterval:0, sinceDate:d!)
    }
    
    func dayOfMonth() -> Int {
        let calendar = NSCalendar.currentCalendar()
        return calendar.components(.CalendarUnitDay, fromDate: self).day
        
    }
    
    func threeLetterMonth(formatter: NSDateFormatter = NSDateFormatter()) -> String {
        formatter.dateStyle = .MediumStyle
        formatter.dateFormat = "MMM"
        return formatter.stringFromDate(self)
    }
    
    func weekdayAndTime(formatter: NSDateFormatter = NSDateFormatter()) -> String {
        formatter.dateFormat = "EEE - HH:MM"
        return formatter.stringFromDate(self)
    }
    
    
    
}