//
//  IndicatorViewModel.swift
//  NTI
//
//  Created by Mohamed Elsdody on 01/10/2021.
//

import Foundation
import RxSwift
import RxCocoa

enum IndicatorTableViewCellType {
    case normal(cellViewModel: IndicatorCellViewModel)
    case error(message: String)
    case empty
}

class IndicatorViewModel : BaseViewModel {
    let disposeBag = DisposeBag()
    private let schedulesStationHelperInstance: ISchedulesStationHelper
    private let repository: RepositoryProtocolBase
    init(schedulesInstance : ISchedulesStationHelper ,indicatorRepository: RepositoryProtocolBase ) {
        self.schedulesStationHelperInstance = schedulesInstance
        self.repository = indicatorRepository
        CellsObservable = cells.asObservable()
    }
    private let loadingBehavior = BehaviorRelay<Bool>(value: false)
    var onShowLoading: Observable<Bool> {
        return loadingBehavior
            .asObservable()
            .distinctUntilChanged()
    }
    private let cells = BehaviorRelay<[IndicatorTableViewCellType]>(value: [])
    var CellsObservable: Observable<[IndicatorTableViewCellType]>
    let onShowError = PublishSubject<String>()
}
