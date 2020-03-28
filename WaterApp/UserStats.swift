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
            updateConsumptionGoal()
        }
    }
    var isActive = UserPreferences.sd.getActiveness(){
        didSet{
            updateConsumptionGoal()
        }
    }
    @Published var consumptionGoal = UserPreferences.sd.getConsumptionGoal()
    var bodyWeight = UserPreferences.sd.getBodyWeight(){
        didSet{
            updateConsumptionGoal()
        }
    }
    @Published var dailyProgress = UserPreferences.sd.getDailyProgress()
    @Published var name = UserPreferences.sd.getName()

    
    // TBD
    static let uStats = UserStats()
    private init() {}
   
    
    @Published var isNewDay: Bool = (Int(Date.timeIntervalSinceReferenceDate) > (Int(Date.timeIntervalSinceReferenceDate)+(86400 - (UserPreferences.sd.getTimeSinceLastLoad()%86400))))
    
    private func calculateConsumptionGoal(smartGoalOn: Bool, isActive: Bool, weight: Int) -> Int {
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
    
    func updateConsumptionGoal(){
        consumptionGoal = calculateConsumptionGoal(smartGoalOn: smartGoalEnabled, isActive: isActive, weight: bodyWeight)
    }
    
    
    
}
