//
//  UserPreferences.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/31/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation


class UserPreferences {
    
    let defaults = UserDefaults.standard
    
    static let sd = UserPreferences()
    
    private init() {
        if defaults.object(forKey: "exists") == nil {
            defaults.set(true, forKey: "exists")
            defaults.set(true, forKey: "notificationsEnabled")
            defaults.set(false, forKey: "isAthletic")
            defaults.set(3600, forKey: "notificationInterval")
            
            defaults.set(0.0, forKey: "amountDrank")
            
            defaults.set(64, forKey: "consumptionGoal")
            defaults.set(100, forKey: "bodyWeight")
            defaults.set(true, forKey: "isMale")
            
        }
    }
    
    func setNotificationInterval(interval: Double){
        defaults.set(interval, forKey: "notificationInterval")
    }
    
    /**
            Changes the Athleticism of the User
     */
    func setAthleticism(isAthletic: Bool){
        defaults.set(isAthletic, forKey: "isAthletic")
    }
    
    /**
            Enables App Drink Notifications
     */
    func enableNotifications(enabled: Bool){
        defaults.set(enabled, forKey: "notificationsEnabled")
    }
    
    // ************
    
    func setAmountDrank(amountDrank: Double){
        defaults.set(amountDrank, forKey: "amountDrank")
    }
    
    
    func setConsumptionGoal(consumptionGoal: Int){
        defaults.set(consumptionGoal, forKey: "consumptionGoal")
    }
    
    /**
            Gettter Method for the notification interval
     */
    func getNotificationInterval() -> Double {
        return defaults.double(forKey: "notificationInterval")
    }
    
    /**
            Getter method for determining if notfications are enabled
     */
    func notificationsEnabled() -> Bool {
        return defaults.bool(forKey: "notificationsEnabled")
    }
    
    func getAmountDrank()->Double{
        return defaults.double(forKey: "amountDrank");
    }
    
    func getDrinkInterval()->Double{
        return defaults.double(forKey: "drinkInterval")
    }
    
    func getAthleticism()->Bool{
        return defaults.bool(forKey: "isAthletic")
    }
    
    func getConsumptionGoal()->Int{
        return defaults.integer(forKey: "consumptionGoal")
    }
    
    func calculateLeftToDrink()-> Double{
        return Double(getConsumptionGoal()) - getAmountDrank()
    }
    
}
