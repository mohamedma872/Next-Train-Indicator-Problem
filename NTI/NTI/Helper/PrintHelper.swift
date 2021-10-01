//
//  PrintHelper.swift
//  NTI
//
//  Created by Mohamed Elsdody on 01/10/2021.
//

import Foundation

func printToConsole(message: String) {
    #if DEBUG
        print(message)
    #endif
}

