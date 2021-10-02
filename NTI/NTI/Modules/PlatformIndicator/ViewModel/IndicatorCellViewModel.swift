//
//  IndicatorCellViewModel.swift
//  NTI
//
//  Created by Mohamed Elsdody on 01/10/2021.
//

import Foundation
struct IndicatorCellViewModel {
    var order: String
    var destinationName: String
    var amountOfMints: String
    init(order: Int,destinationName: String,amountOfMints: Int) {
        self.order = "\(order)"
        self.destinationName = destinationName
        if amountOfMints > 1
        {
            self.amountOfMints = "\(amountOfMints) mins"
        }
        else
        {
            self.amountOfMints = "\(amountOfMints) min"
        }
    }
}
