//  TrainScheduleHelper.swift
//  NTI
//
//  Created by Mohamed Elsdody on 01/10/2021.
//

import Foundation
import UIKit

@objc protocol ITimeHelper{
    /// check current or specific time is between two range or not
    /// - Parameters:
    ///   - currentTime: this paramter is current time .
    ///   - startTimeRange: this paramter is start time range .
    ///   - endTimeRange: this paramter is end time range .
    /// - Returns: Bool
    @objc optional func checkTimeWithinStationTimeRange(currentTime: Date,startTimeRange: Date,endTimeRange: Date) -> Bool
    /// Get current time in predefined format
    ///
    /// - returns: String?
    @objc optional func getTimeNow() -> String?
}

class TimeHelper : ITimeHelper
{
    /// check current or specific time is between two range or not
    /// - Parameters:
    ///   - currentTime: this paramter is current time .
    ///   - startTimeRange: this paramter is start time range .
    ///   - endTimeRange: this paramter is end time range .
    /// - Returns: Bool
    func checkTimeWithinStationTimeRange(currentTime: Date,startTimeRange: Date,endTimeRange: Date) -> Bool
    {
        // In recent versions of Swift Date objectst are comparable, so you can
        // do greater than, less than, or equal to comparisons on dates without
        // needing a date extension
        if currentTime >= startTimeRange &&
            currentTime <= endTimeRange
        {
            printToConsole(message: "The time is in range")
            return true
        }else
        {
            printToConsole(message: "The time is not in range")
            return false
        }
    }
    /// Get current time in predefined format
    ///
    /// - parameter specificTime: this paramter is optional and we use it in test purpose only incase we need to return hardcoded date.
    /// - returns: String?
    func getTimeNow() -> String?
    {
        let now = Date()
        if let formate = now.getFormattedDate()
        {
            return formate
        }
        return nil
    }
    static let shared = TimeHelper()
    // we have to remove the private keyword so that we can override it. If not, the compiler will complain. This is why that line is commented out above.
    private init() {}
}

extension Formatter {
    /// Get DateFormatter object in predefined format
    /// - returns: DateFormatter()
    static func getDateFormatter() -> DateFormatter {
        let dateformate = DateFormatter()
        dateformate.dateFormat = GlobalConstants.format
        dateformate.locale = Locale.current
        return dateformate
    }
}

extension Date {
    /// Get date object in  string format with predefined format
    /// - returns: String?
    func getFormattedDate() -> String? {
        return Formatter.getDateFormatter().string(for: self)
    }
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    func currenthourNumber() -> Int? {
        return Calendar.current.dateComponents([.hour], from: self).hour
    }
}


