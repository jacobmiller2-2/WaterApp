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
    //Notifications
    @Published var smartNotifications = UserPreferences.sd.smartNotifications()
    @Published var notificationsEnabled =  UserPreferences.sd.notificationsEnabled()
    @Published var notificationInterval = UserPreferences.sd.getNotificationInterval()
    
    //Stats
    @Published var smartGoalEnabled = UserPreferences.sd.isSmartGoalOn()
    @Published var isAthletic = UserPreferences.sd.getAthleticism()
    @Published var consumptionGoal = UserPreferences.sd.getConsumptionGoal()
    @Published var bodyWeight = UserPreferences.sd.getBodyWeight()
    @Published var dailyProgress = UserPreferences.sd.getDailyProgress()
    @Published var name = UserPreferences.sd.getName()
    
    // TBD
    
   
    
    @Published var isNewDay: Bool = (Int(Date.timeIntervalSinceReferenceDate) > (Int(Date.timeIntervalSinceReferenceDate)+(86400 - (UserPreferences.sd.getTimeSinceLastLoad()%86400))))
    
    func calculateConsumptionGoal(smartGoalOn: Bool, isActive: Bool, weight: Int, currentGoal: Int) -> Int {
        var goal = 0;
        print("currentGoal \(currentGoal)")
        if(smartGoalOn){
            goal = Int(0.67 * Double(weight))
            if(isActive){
                goal += 18
            }
            return goal
        }
        return currentGoal
    }
    
}
