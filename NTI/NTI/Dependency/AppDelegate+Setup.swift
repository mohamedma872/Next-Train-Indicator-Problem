//
//  AppDelegate+Setup.swift
//  NTI
//
//  Created by Mohamed Elsdody on 01/10/2021.
//

import Foundation
import Swinject
extension AppDelegate {
    /**
     Set up the depedency graph in the DI container
     setup the services
     */
     func setupDependencies() {
         // services
         container.register(ITimeHelper.self) { _ in TimeHelper.shared  }.inObjectScope(.container)
         container.register(ISchedulesStationHelper.self) { _ in SchedulesStationHelper.shared  }.inObjectScope(.container)
         container.register(RepositoryProtocolBase.self) { r in IndicatorImp(schedulesStationHelper: r.resolve(ISchedulesStationHelper.self)!, timeHelper: r.resolve(ITimeHelper.self)!)  }.inObjectScope(.container)
         // viewmodel
         container.register(BaseViewModel.self ,name:"IndicatorViewModel") { r in IndicatorViewModel( indicatorRepository: r.resolve(RepositoryProtocolBase.self)! ) }.inObjectScope(.container)

    }
}
