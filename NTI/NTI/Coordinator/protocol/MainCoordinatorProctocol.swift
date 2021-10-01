//
//  MainCoordinatorProctocol.swift
//  NTI
//
//  Created by Mohamed Elsdody on 30/09/2021.
//
import Foundation
protocol MainCoordinatorProctocol : AnyObject {
    /**
     Invoked when the Main flow is no longer needed
     */
     func didFinshed(_ child : Coordinator)
}
