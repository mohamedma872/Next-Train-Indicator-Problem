//
//  TrainModel.swift
//  NTI
//
//  Created by Mohamed Elsdody on 29/09/2021.
//

import Foundation
struct TrainModel {
    var trainNumber: String
    //the train could be service off so destination should be optional
    var destination: DestinationModel?
    //the train could be service off so arrivalTime should be optional
    var arrivalTime: String?
}
