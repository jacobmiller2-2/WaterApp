//
//  DateExt.swift
//  WaterApp
//
//  Created by Jacob Miller on 2/3/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation

extension Date {
    func isNewDay()-> Date{
        
            
        
        
        return Calendar.current.startOfDay(for: self)
    }
}
