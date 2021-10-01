//
//  SchedulesStationHelperTests.swift
//  NTITests
//
//  Created by Mohamed Elsdody on 01/10/2021.
//

import XCTest
@testable import NTI

class SchedulesStationHelperTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGet_Schedules_ForStation_withOutStartTimeAndEndTime_withMints_Interval() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // given
        let sut = SchedulesStationHelperMock(specificTime: "8:00")
        
        // when
        // Mock Destination Model
        let central​StationSchedules = sut.getSchedulesForStation(frequencyTime: 20, measurementUnit: RepeatIntervalUnit.minute, startH: nil, endH: nil) ?? []
        
        //  let central​Station = DestinationModel(name: "central​Station", frequency: (frequencyTime: 20, measurementUnit: RepeatIntervalUnit.minute, startH: nil, endH: nil), schedulesLst: central​StationSchedules)
        
        // then
        XCTAssertEqual(central​StationSchedules.count, 73)
    }
    func testGet_Schedules_ForStation_withOutStartTimeAndEndTime_withHour_Interval() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // given
        let sut = SchedulesStationHelperMock(specificTime: "8:00")
        
        // when
        // Mock Destination Model
        let central​StationSchedules = sut.getSchedulesForStation(frequencyTime: 1, measurementUnit: RepeatIntervalUnit.hour, startH: nil, endH: nil) ?? []
        
        //  let central​Station = DestinationModel(name: "central​Station", frequency: (frequencyTime: 20, measurementUnit: RepeatIntervalUnit.minute, startH: nil, endH: nil), schedulesLst: central​StationSchedules)
        
        // then
        XCTAssertEqual(central​StationSchedules.count, 25)
    }
    
    
}
