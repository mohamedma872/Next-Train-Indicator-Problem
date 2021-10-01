//
//  SchedulesStationHelperMock.swift
//  NTITests
//
//  Created by Mohamed Elsdody on 01/10/2021.
//

import Foundation
@testable import NTI
import Foundation
class SchedulesStationHelperMock: ISchedulesStationHelper
{
    var currentTime: String?
    init(specificTime: String?)
    {
        self.currentTime = specificTime
    }
    /// Get the schedules List that represent the train schedules like train time table for every station based on the params
    /// - Parameters:
    ///   - frequencyTime: represent the repeated time like evey 6 min the train will arrive to this destination
    ///   - measurementUnit: this is enum for Hour , minute)
    ///   - startH: his paramter is start time range .
    ///   - endH: his paramter is end time range .
    /// - Returns: list of dates
    func getSchedulesForStation(frequencyTime: Int, measurementUnit: RepeatIntervalUnit, startH: Date?, endH: Date?) -> [Date]? {
        //  the first case that we have startTime and endTime
        if let startTime = startH ,let endTime = endH
        {
            switch measurementUnit {
            case .minute:
                let intervals = TimeDay(startDate: startTime, endDate: endTime, step: DateComponents(minute: frequencyTime))
                return intervals.timeIntervals
            case .hour:
                let intervals = TimeDay(startDate: startTime, endDate: endTime, step: DateComponents(minute: frequencyTime))
                return intervals.timeIntervals
            }
        }
        // the second case that we don't have startTime and endTime
        if(startH == nil || endH == nil)
        {
            // need to get current time in our predifned format
            let startDate1 = DateComponents(calendar: .current, day: Date().dayNumberOfWeek()!).date!
            let endDate1   = DateComponents(calendar: .current, day: Date().dayNumberOfWeek()! + 1).date!
            let formatter = DateFormatter()
            formatter.dateFormat = GlobalConstants.format
           // let starttime = formatter.date(from: formatter.string(from: startDate1))
            //let endtime = formatter.date(from: formatter.string(from: endDate1))
            switch measurementUnit {
            case .minute:
                let intervals = TimeDay(startDate: startDate1, endDate: endDate1, step: DateComponents(minute: frequencyTime))
                return intervals.timeIntervals
            case .hour:
                let intervals = TimeDay(startDate: startDate1, endDate: endDate1, step: DateComponents(hour: frequencyTime))
                return intervals.timeIntervals
            }
        }
        return nil
    }
}
