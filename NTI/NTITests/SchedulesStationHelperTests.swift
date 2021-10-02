//
//  SchedulesStationHelperTests.swift
//  NTITests
//
//  Created by Mohamed Elsdody on 01/10/2021.
//

import XCTest
@testable import NTI

class SchedulesStationHelperTests: XCTestCase {
    
    var sut : ISchedulesStationHelper!
    override func setUp() {
           super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SchedulesStationHelperMock(specificTime: "8:00")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
    func testGet_Schedules_ForStationCentral​_withOutStartTimeAndEndTime_WithMints_Interval() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // when
        // Mock Destination Model
        let central​StationSchedules = sut.getSchedulesForStation(frequencyTime: 20, measurementUnit: RepeatIntervalUnit.minute, startH: nil, endH: nil) ?? []
        
        // then
        XCTAssertEqual(central​StationSchedules.count, 73)
    }
    func testGet_Schedules_ForStationCircular_withOutStartTimeAndEndTime_WithHour_Interval() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // when
        // Mock Destination Model
        let circularStationSchedules = sut.getSchedulesForStation(frequencyTime: 1, measurementUnit: RepeatIntervalUnit.hour, startH: nil, endH: nil) ?? []

        
        // then
        XCTAssertEqual(circularStationSchedules.count, 25)
    }
    
    func testGet_Schedules_ForStationNorth​Square_withStartTimeAndEndTime_WithHour_Interval() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // when
        // Mock Destination Model
        let startTime = Formatter.getDateFormatter().date(from: "07:00")
        let EndTime = Formatter.getDateFormatter().date(from: "22:00")
        let north​SquareStationSchedules = sut.getSchedulesForStation(frequencyTime: 12, measurementUnit: RepeatIntervalUnit.minute, startH: startTime, endH: EndTime) ?? []

        
        // then
        XCTAssertEqual(north​SquareStationSchedules.count, 76)
    }
    func testGet_Schedules_ForStationWest​Market_withStartTimeAndEndTime_WithMints_Interval() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // when
        // Mock Destination Model
        let startTime = Formatter.getDateFormatter().date(from: "05:30")
        let EndTime = Formatter.getDateFormatter().date(from: "01:30")
        let west​MarketStationSchedules = sut.getSchedulesForStation(frequencyTime: 6, measurementUnit: RepeatIntervalUnit.minute, startH: startTime, endH: EndTime) ?? []

        
        // then
        XCTAssertEqual(west​MarketStationSchedules.count, 241)
    }
   
}
