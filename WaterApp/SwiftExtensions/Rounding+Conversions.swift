//
//  Rounding.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/11/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation

//
// extension created by stackoverflow user Mehul
extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func roundToString(places: Int)-> String {
        return String(format: "%.\(places)f",self)
    }
    
    func secondsToHoursMinutes()->String{
        let seconds = Int(self)
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .full

        let formattedString = formatter.string(from: TimeInterval(seconds))!

        return formattedString
        
    }
}
