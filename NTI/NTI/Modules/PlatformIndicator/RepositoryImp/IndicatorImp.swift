//
//  IndicatorImp.swift
//  NTI
//
//  Created by Mohamed Elsdody on 02/10/2021.
//

import Foundation
import RxCocoa
import RxSwift
class IndicatorImp: Repository
{
    typealias T = Next​Train​​Indicator​Model
    var schedulesStationHelper: ISchedulesStationHelper
    var timeHelper: ITimeHelper
    init(schedulesStationHelper: ISchedulesStationHelper,timeHelper: ITimeHelper)
    {
        self.schedulesStationHelper = schedulesStationHelper
        self.timeHelper = timeHelper
    }
    func list() -> Observable<[T?]> {
        return Observable.create { observer -> Disposable in
            var stationLst:[DestinationModel] = []
            // For Central​ ​Station
            let central​StationSchedules = self.schedulesStationHelper.getSchedulesForStation(frequencyTime: 20, measurementUnit: RepeatIntervalUnit.minute, startH: nil, endH: nil) ?? []
            let central​Station = DestinationModel(name: "Central​", frequency: (frequencyTime: 20, measurementUnit: RepeatIntervalUnit.minute, startH: nil, endH: nil),schedulesLst: central​StationSchedules )
            stationLst.append(central​Station)
            // for Circular Station
            let circularStationSchedules = self.schedulesStationHelper.getSchedulesForStation(frequencyTime: 1, measurementUnit: RepeatIntervalUnit.hour, startH: nil, endH: nil) ?? []
            let circularStation = DestinationModel(name: "Circular", frequency: (frequencyTime: 1, measurementUnit: RepeatIntervalUnit.hour, startH: nil, endH: nil),schedulesLst: circularStationSchedules )
            stationLst.append(circularStation)
            // for North​ ​Square Station
            let northStartTime = Formatter.getDateFormatter().date(from: "07:00")
            let northEndTime = Formatter.getDateFormatter().date(from: "22:00")
            let northStationSchedules = self.schedulesStationHelper.getSchedulesForStation(frequencyTime: 12, measurementUnit: RepeatIntervalUnit.minute, startH: northStartTime, endH: northEndTime) ?? []
            let northSStation = DestinationModel(name: "North​ ​Square", frequency: (frequencyTime: 12, measurementUnit: RepeatIntervalUnit.minute, startH: northStartTime, endH: northEndTime),schedulesLst: northStationSchedules )
            stationLst.append(northSStation)
            // for West​ ​Market Station
            let westStartTime = Formatter.getDateFormatter().date(from: "05:30")
            let westEndTime = Formatter.getDateFormatter().date(from: "01:30")
            let west​StationSchedules = self.schedulesStationHelper.getSchedulesForStation(frequencyTime: 6, measurementUnit: RepeatIntervalUnit.minute, startH: westStartTime, endH: westEndTime) ?? []
            let west​Station = DestinationModel(name: "West​ ​Market", frequency: (frequencyTime: 6, measurementUnit: RepeatIntervalUnit.minute, startH: westStartTime, endH: westEndTime),schedulesLst: west​StationSchedules )
            stationLst.append(west​Station)
            // filter
            var scheduleList:[Next​Train​​Indicator​Model] = []
            let calendar = Calendar.current
            // get current time as string
            if let nowTimeString = self.timeHelper.getTimeNow()
            {
                // Convert String to Date
                if  let nowTime =  Formatter.getDateFormatter().date(from: nowTimeString)?.toCurrentTimezone()
                {
                    // get current time + 15 mints
                    if  let newTime = calendar.date(byAdding: .minute, value: 15, to: nowTime){
                        // filter it to get times less than or equal current time + 15 mints && more than or equal current time
                        stationLst = stationLst.filter({
                            model -> Bool in
                            // sort it by time asc
                            // i built the new model Next​Train​​Indicator​Model
                            // i checked the station time withing range (current , current + 15 mints) and return this items
                            let result = model.schedulesLst.filter({ self.timeHelper.checkTimeWithinStationTimeRange(currentTime: $0, startTimeRange: nowTime, endTimeRange: newTime)}).map({Next​Train​​Indicator​Model(destinationName: model.name, trainArrivalTime: $0)})
                            scheduleList.append(contentsOf: result)
                            return result.count > 0 ? true : false
                        })
                    }
                }
            }
            // i sorted the final list asc
            scheduleList = scheduleList.sorted(by: {$0.trainArrivalTime < $1.trainArrivalTime})
            observer.onNext(scheduleList)
            return Disposables.create()
        }
    }
}
