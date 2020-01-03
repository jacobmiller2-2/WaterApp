//
//  LocalNotificationManager.swift
//  WaterApp
//
//  Created by Jacob Miller on 12/28/19.
//  Copyright © 2019 Jacob Miller. All rights reserved.
//
import UserNotifications

struct Notification {
    var id : String
    var title : String
    var body : String
}

class LocalNotificationManager {
    
    var notifications = [Notification]()
    
    static func requestAuth() -> Void {
        UNUserNotificationCenter
        .current()
            .requestAuthorization(options: [.alert, .badge, .sound]){
                granted, error in
                if granted == true && error == nil {
                    // We have permission!
                }
        }
    }
    
    func addNotification(title: String, body: String) -> Void {
        notifications.append(Notification(id: UUID().uuidString, title: title, body: body))
    }
    func scheduleNotifications() -> Void {
        // Consider creating two parameters similar to UNTimeIntervalNotifcation Trigger
        
        for notification in notifications {
            
            let content = UNMutableNotificationContent()
            
            content.title = notification.title
            content.body = notification.body
            
            let customSound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "water-drop-noti.wav"))
            content.sound = customSound
            
            let timeUntilDelivery = 5.0 // In seconds. Double
            let repeats = false;
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeUntilDelivery, repeats: repeats)
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return }
                print("Scheduling notification with id: \(notification.id).\nArriving in: \(timeUntilDelivery) seconds.\nRepeats: \(repeats).")
            }
        }
    }
}
