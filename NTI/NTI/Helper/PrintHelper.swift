//
//  PrintHelper.swift
//  NTI
//
//  Created by Mohamed Elsdody on 01/10/2021.
//

import Foundation
/// # Print
/// it will print only in debug mode
func printToConsole(message: String) {
    #if DEBUG
        print(message)
    #endif
}

