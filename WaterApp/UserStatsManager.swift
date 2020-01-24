//
//  UserStatsManager.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/10/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation

// Manages user data: stats, preferences, settings
class UserStatsManager{
    
    let defaults = UserDefaults.standard
    
    static let shared = UserStatsManager()
    
    private init() {
        if defaults.object(forKey: "exists") == nil {
            defaults.set(true, forKey: "exists")
            defaults.set(0.0, forKey: "amountDrank")
            defaults.set(3600, forKey: "drinkInterval")
            defaults.set(false, forKey: "isAthletic")
            defaults.set(64, forKey: "consumptionGoal")
            defaults.set(100, forKey: "bodyWeight")
            defaults.set(true, forKey: "isMale")
        }
    }
    
    func setAmountDrank(amountDrank: Double){
        defaults.set(amountDrank, forKey: "amountDrank")
    }
    
    func setDrinkInterval(drinkInterval: Double){
        defaults.set(drinkInterval, forKey: "drinkInterval")
    }
    
    func setAthleticism(isAthletic: Bool){
        defaults.set(isAthletic, forKey: "isAthletic")
    }
    
    func setConsumptionGoal(consumptionGoal: Int){
        UserDefaults.standard.set(consumptionGoal, forKey: "consumptionGoal")
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
    
    // returns all user statistics
    func getUserStats(){
        
    }
    
    // returns all user preferences
    func getUserPreferences(){
        
    }
    
    
}
