//
//  UserNotifications.swift
//  WaterApp
//
//  Created by Jacob Miller on 3/27/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation

class UserNotifications : ObservableObject {
    

    var smartNotifications: Bool = UserPreferences.sd.smartNotifications(){
        didSet{
            if(smartNotifications){
                notificationInterval = calculateSmartInterval(isActive: UserStats.uStats.isAthletic, goal: UserStats.uStats.consumptionGoal)
                LocalNotificationManager.shared.removeAndSetNotifications(title: "Drink", body: "You should Drink Water", interval: notificationInterval)
            } else {
                notificationInterval = 3600
                LocalNotificationManager.shared.removeAndSetNotifications(title: "Drink", body: "You should Drink Water", interval: notificationInterval)
            }
            objectWillChange.send()
        }
    }
    var notificationsEnabled: Bool =  UserPreferences.sd.notificationsEnabled(){
        didSet{
            if(!notificationsEnabled){
                smartNotifications = false;
                notificationInterval = 0;
                LocalNotificationManager.shared.removeNotifications()
            }
            objectWillChange.send()
        }
    }
    
    @Published var notificationInterval: Double = UserPreferences.sd.getNotificationInterval()
    
    @Published var notificationStatus: NotificationStatus = NotificationStatus.SmartNotifications
    
    func calculateSmartInterval(isActive: Bool, goal: Int) -> Double{
        var interval = 0;
        if(isActive){
            interval = 86400/30
        } else {
            interval = 86400/24
        }
        return Double(interval)
    }
    
}

enum NotificationStatus {
    case SmartNotifications
    case SetNotififications
    case NoNotifications
}
