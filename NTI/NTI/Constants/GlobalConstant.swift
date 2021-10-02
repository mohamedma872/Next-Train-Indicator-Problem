//
//  GlobalConstant.swift
//  NTI
//
//  Created by Mohamed Elsdody on 01/10/2021.
//

import Foundation
struct GlobalConstants{
    static let format = "HH:mm"
    /// The​ ​NTI​ ​display​ ​should​ ​be​ ​able​ ​to​ ​display​ ​all​ ​expected​ ​train​ ​information​ ​for​ ​the​ ​next​ ​15​ ​VT mins.
    static let refreshTime = 15
}
/// this enum for measurment units etc : the train will come every 20 mints or every one hour 
enum RepeatIntervalUnit{
    case minute
    case hour
}
