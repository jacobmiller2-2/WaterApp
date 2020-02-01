//
//  UserStats.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/10/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation

// Manages user data: stats, preferences, settings
class UserStats : ObservableObject{
    
    
    @Published var isAthletic = UserPreferences.sd.getAthleticism()
    @Published var notificationsEnabled =  UserPreferences.sd.notificationsEnabled()
    @Published var notificationInterval = UserPreferences.sd.getNotificationInterval()
    
    
}
