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
    var amountOfMints: String = "0"
    init(order: Int,destinationName: String,destintationTime: Date) {
        self.order = "\(order)"
        self.destinationName = destinationName
        // calculate the differnce between current time and arrival time in mints
        let formatter = DateFormatter()
        formatter.dateFormat = GlobalConstants.format
        // get current time as string
        if let nowTimeString = TimeHelper.shared.getTimeNow()
        {
            // Convert String to Date
            if  let nowTime =  formatter.date(from: nowTimeString)?.toCurrentTimezone()
            {
                let diffComponents = Calendar.current.dateComponents([ .minute], from: nowTime  , to:  destintationTime)
                if let amountOfMints = diffComponents.minute{
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
        }
    }
}


