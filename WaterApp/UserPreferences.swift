//
//  UserPreferences.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/31/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation

//TODO: Clean me up please
class UserPreferences {
    
    let defaults = UserDefaults.standard
    
    static let sd = UserPreferences()
    
    private init() {
        
        if defaults.object(forKey: existsKey) == nil {
            defaults.set(Int(Date.timeIntervalSinceReferenceDate),forKey: lastLoadup)
            defaults.set(true, forKey: existsKey)
            defaults.set(true, forKey: notificationsEnabledKey)
            defaults.set(false, forKey: isAthleticKey)
            defaults.set(3600, forKey: notificationIntervalKey)
            defaults.set(64, forKey: consumptionGoalKey)
            defaults.set(100, forKey: bodyWeightKey)
            defaults.set(false, forKey: smartNotificationsKey)
            defaults.set(0.0, forKey: dailyProgressKey)
            defaults.set(false, forKey: smartGoalEnabledKey)
        }
    }
    func getTimeSinceLastLoad() -> Int {
        return (defaults.integer(forKey: lastLoadup))
    }
    
    func markLastLoadTime(){
        defaults.set(Int(Date.timeIntervalSinceReferenceDate),forKey: lastLoadup)
    }
    
    func setNotificationInterval(interval: Double) {
        defaults.set(interval, forKey: notificationIntervalKey)
    }
    
    /**
            Changes the Athleticism of the User
     */
    func setAthleticism(isAthletic: Bool) {
        defaults.set(isAthletic, forKey: isAthleticKey)
    }
    
    /**
            Enables App Drink Notifications
     */
    func enableNotifications(enabled: Bool) {
        defaults.set(enabled, forKey: notificationsEnabledKey)
    }
    
    // ************
    
    func setDailyProgress(progress: Double) {
        defaults.set(progress, forKey: dailyProgressKey)
    }
    
    func getDailyProgress() -> Double {
        defaults.double(forKey: dailyProgressKey)
    }
    
    
    func setConsumptionGoal(consumptionGoal: Int) {
        defaults.set(consumptionGoal, forKey: consumptionGoalKey)
    }
    
    /**
            Gettter Method for the notification interval
     */
    func getNotificationInterval() -> Double {
        return defaults.double(forKey: notificationIntervalKey)
    }
    
    /**
            Getter method for determining if notfications are enabled
     */
    func notificationsEnabled() -> Bool {
        return defaults.bool(forKey: notificationIntervalKey)
    }
    
    
    func smartNotifications() -> Bool {
        return defaults.bool(forKey: smartNotificationsKey)
    }
    
    func setSmartNotifications(isOn: Bool) {
        defaults.set(isOn, forKey: smartNotificationsKey)
    }
    
    func getAthleticism() -> Bool { // change to lifestyle
        return defaults.bool(forKey: isAthleticKey)
    }
    
    func getConsumptionGoal() -> Int {
        return defaults.integer(forKey: consumptionGoalKey)
    }

    func getName() -> String {
        return defaults.string(forKey: nameKey) ?? "Your Majesty"
    }
    
    func setName(name: String) {
        defaults.set(name, forKey: nameKey)
    }
    
    func getBodyWeight() -> Int {
        return defaults.integer(forKey: bodyWeightKey)
        
    }
    
    func setBodyWeight(weight: Int) -> Void {
        defaults.set(weight, forKey: bodyWeightKey)
    }
    
    func isSmartGoalOn() -> Bool {
        return defaults.bool(forKey: smartGoalEnabledKey)
    }
    
    func setSmartGoalEnabled(isOn: Bool) -> Void {
        defaults.set(isOn, forKey: smartGoalEnabledKey)
    }

}
