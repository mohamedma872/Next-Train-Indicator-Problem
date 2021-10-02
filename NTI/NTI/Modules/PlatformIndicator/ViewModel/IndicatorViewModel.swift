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
    private let repository: RepositoryProtocolBase
    init(indicatorRepository: RepositoryProtocolBase ) {
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
    func getStations() {
        loadingBehavior.accept(true)
        self.cells.accept([])
        (repository as! IndicatorImp).list().subscribe(
                    onNext: { [weak self] res  in
                        let data = res as [Next​Train​​Indicator​Model?]
                        self?.loadingBehavior.accept(false)
                        // i got the order of every element with enumerated()
                        self?.cells.accept(data.enumerated().compactMap { (offset, value) in .normal(cellViewModel: IndicatorCellViewModel(order: offset + 1, destinationName: value!.destinationName, destintationTime: value!.trainArrivalTime)) })
                    },
                    onError: { [weak self] err in
                        self?.loadingBehavior.accept(false)
                        self?.onShowError.onNext(err.localizedDescription)
                    }
                )
                .disposed(by: disposeBag)
     }

}
