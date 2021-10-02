//
//  SchedulesStationHelper.swift
//  NTI
//
//  Created by Mohamed Elsdody on 01/10/2021.
//

import Foundation
protocol ISchedulesStationHelper{
    /// Get the schedules List that represent the train schedules like train time table for every station based on the params
    /// - Parameters:
    ///   - frequencyTime: represent the repeated time like evey 6 min the train will arrive to this destination
    ///   - measurementUnit: this is enum for Hour , minute)
    ///   - startH: his paramter is start time range .
    ///   - endH: his paramter is end time range .
    /// - Returns: list of dates
    func getSchedulesForStation(frequencyTime: Int,measurementUnit: RepeatIntervalUnit, startH: Date?, endH: Date?) -> [Date]?
}
class SchedulesStationHelper : ISchedulesStationHelper{
    
    static let shared = SchedulesStationHelper()
    // we have to remove the private keyword so that we can override it. If not, the compiler will complain. This is why that line is commented out above.
    private init() {}
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
            var startDate: Date
            var endDate: Date
            // for the case of West​ ​Market , start time : 05:30 , endTime: 01:30
            if(startTime > endTime)
            {
                 startDate = DateComponents(calendar: .current, day: Date().dayNumberOfWeek()!).date!
                 endDate = DateComponents(calendar: .current, day: Date().dayNumberOfWeek()! + 1).date!
            }else
            {
                startDate = startTime
                endDate   = endTime
            }
            switch measurementUnit {
            case .minute:
                let intervals = TimeDay(startDate: startDate, endDate: endDate, step: DateComponents(minute: frequencyTime))
                return intervals.timeIntervals
            case .hour:
                let intervals = TimeDay(startDate: startDate, endDate: endDate, step: DateComponents(hour: frequencyTime))
                return intervals.timeIntervals
            }
        }
        // the second case that we don't have startTime and endTime
        if(startH == nil || endH == nil)
        {
            let startDate1 = DateComponents(calendar: .current, day: Date().dayNumberOfWeek()!).date!
            let endDate1   = DateComponents(calendar: .current, day: Date().dayNumberOfWeek()! + 1).date!
            let formatter = DateFormatter()
            formatter.dateFormat = GlobalConstants.format
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

struct TimeDay {
    var startDate: Date
    var endDate: Date
    var step: DateComponents
    var calendar = Calendar.autoupdatingCurrent
    var dateFormatter: DateFormatter = {
        return Formatter.getDateFormatter()
    }()
    init(startDate: Date, endDate: Date, step: DateComponents) {
        self.startDate = startDate
        self.endDate   = endDate
        self.step      = step
    }
    var timeIntervals : [Date] {
        guard self.startDate <= self.endDate else {
            return []
        }
        var result = [self.startDate]
        var date = self.startDate
        while date < self.endDate {
            date = self.calendar.date(byAdding: step, to: date)!
            printToConsole(message: "date: " + date.formatted())
            result.append(date)
        }
        return result
    }
    var timeRepresentation : [String] {
        return self.timeIntervals.map { self.dateFormatter.string(from: $0) }
    }
}
