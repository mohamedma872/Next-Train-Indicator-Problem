//
//  TimeHelperTests.swift
//  NTITests
//
//  Created by Mohamed Elsdody on 01/10/2021.
//

import XCTest
@testable import NTI

class TimeHelperTests: XCTestCase {
    var timeHelper : ITimeHelper!
    override func setUp() {
           super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
         timeHelper = TimeHelperMock(specificTime: "8:00")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        timeHelper = nil
        super.tearDown()
    }

    func test_check_time_within_StationTimeRange_IsTrue() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    
        
        // when
        //get current time
        let calendar = Calendar.current
        // fake some time
        let formatter = DateFormatter()
        formatter.dateFormat = GlobalConstants.format
        // get harcoded date as string
        let nowTimeString = timeHelper.getTimeNow()
        // Convert String to Date
        let nowTime =  formatter.date(from: nowTimeString!)
        // fake station start time
        let eight_today = calendar.date(
          bySettingHour: 4,
          minute: 0,
          second: 0,
          of: nowTime!)!
        // fake station end time
        let four_thirty_today = calendar.date(
          bySettingHour: 16,
          minute: 30,
          second: 0,
          of: nowTime!)!
        
        // then
        XCTAssertEqual(timeHelper.checkTimeWithinStationTimeRange(currentTime: nowTime!, startTimeRange: eight_today, endTimeRange: four_thirty_today), true)
    }
    func test_check_time_within_StationTimeRange_IsFalse() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // when
        //get current time
        let calendar = Calendar.current
        // fake some time
       
        let formatter = DateFormatter()
        formatter.dateFormat = GlobalConstants.format
        // get harcoded date as string
        let nowTimeString = timeHelper.getTimeNow()
        // Convert String to Date
        let nowTime =  formatter.date(from: nowTimeString!)
        // fake station start time
        let eight_today = calendar.date(
          bySettingHour: 10,
          minute: 0,
          second: 0,
          of: nowTime!)!
        // fake station end time
        let four_thirty_today = calendar.date(
          bySettingHour: 16,
          minute: 30,
          second: 0,
          of: nowTime!)!
        
        // then
        XCTAssertEqual(timeHelper.checkTimeWithinStationTimeRange(currentTime: nowTime!, startTimeRange: eight_today, endTimeRange: four_thirty_today), false)
    }

}
