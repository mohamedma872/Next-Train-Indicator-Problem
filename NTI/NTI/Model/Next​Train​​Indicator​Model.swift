//
//  Next​Train​​Indicator​Model.swift
//  NTI
//
//  Created by Mohamed Elsdody on 29/09/2021.
//

import Foundation
struct Next​Train​​Indicator​Model {
    // the Next​ Train​​ Indicator​ could be service off so trainList should be optional
    var trainList: [TrainModel]?
    // the Next​ Train​​ Indicator​ could be service off so current​VT should be optional
    var current​VT: String?
    // Platform Number for indicating where is the​ Train​​ Indicator​ board
    var PlatformNumber: Int
}
