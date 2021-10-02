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
    typealias T = DestinationModel
    var schedulesStationHelper: ISchedulesStationHelper
    init(schedulesStationHelper: ISchedulesStationHelper)
    {
        self.schedulesStationHelper = schedulesStationHelper
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
            observer.onNext(stationLst)
            return Disposables.create()
        }
    }
}
