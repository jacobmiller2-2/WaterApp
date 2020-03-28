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
    
    //Stats
    var smartGoalEnabled = UserPreferences.sd.isSmartGoalOn(){
        didSet{
            consumptionGoal = calculateConsumptionGoal(smartGoalOn: smartGoalEnabled, isActive: isAthletic, weight: bodyWeight)
        }
    }
    @Published var isAthletic = UserPreferences.sd.getAthleticism()
    @Published var consumptionGoal = UserPreferences.sd.getConsumptionGoal()
    @Published var bodyWeight = UserPreferences.sd.getBodyWeight()
    @Published var dailyProgress = UserPreferences.sd.getDailyProgress()
    @Published var name = UserPreferences.sd.getName()

    
    // TBD
    static let uStats = UserStats()
    private init() {}
   
    
    @Published var isNewDay: Bool = (Int(Date.timeIntervalSinceReferenceDate) > (Int(Date.timeIntervalSinceReferenceDate)+(86400 - (UserPreferences.sd.getTimeSinceLastLoad()%86400))))
    
    func calculateConsumptionGoal(smartGoalOn: Bool, isActive: Bool, weight: Int) -> Int {
        var goal: Int
        if(smartGoalOn){
            if(weight == 0){
                return 80; //Avg amount of water people should drink
            }
            goal = Int(0.67 * Double(weight))
            if(isActive){
                return goal + 18
            }
            return goal
        }
        return 0;
    }
    
    
    
}
