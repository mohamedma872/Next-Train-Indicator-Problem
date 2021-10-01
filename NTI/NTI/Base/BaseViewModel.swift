//
//  BaseViewModel.swift
//  NTI
//
//  Created by Mohamed Elsdody on 01/10/2021.
//

import Foundation
import RxSwift
protocol BaseViewModel {
    var onShowLoading: Observable<Bool> { get }
    var onShowError: PublishSubject<String> { get }
}
