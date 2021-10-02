//
//  IndicatorViewModelTests.swift
//  NTITests
//
//  Created by Mohamed Elsdody on 02/10/2021.
//
@testable import NTI
import XCTest
import RxSwift
import RxTest
import RxBlocking

class IndicatorViewModelTests: XCTestCase {
    var disposeBag: DisposeBag!
    var viewModel: IndicatorViewModel!
    var scheduler: ConcurrentDispatchQueueScheduler!
    var testScheduler: TestScheduler!
    override func setUp() {
           super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        disposeBag = DisposeBag()
        viewModel = IndicatorViewModel( indicatorRepository: IndicatorImp(schedulesStationHelper: SchedulesStationHelperMock(specificTime: "8:00"), timeHelper: TimeHelperMock(specificTime: "8:00")))
        scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
        testScheduler = TestScheduler(initialClock: 0)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        disposeBag = nil
        viewModel = nil
        scheduler = nil
        testScheduler = nil
        super.tearDown()
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
