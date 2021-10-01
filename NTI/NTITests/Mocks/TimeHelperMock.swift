//
//  TimeHelperMock.swift
//  NTITests
//
//  Created by Mohamed Elsdody on 01/10/2021.
//
@testable import NTI
import Foundation
class TimeHelperMock: ITimeHelper
{
    var currentTime: String?
    init(specificTime: String?)
    {
        self.currentTime = specificTime
    }
    
    /// spy method for getting current time in predefined format
    ///
    /// - parameter specificTime: this paramter is optional and we use it in test purpose only incase we need to return hardcoded date.
    /// - returns: String?
    func getTimeNow() -> String? {
        return currentTime
    }
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
}
 
