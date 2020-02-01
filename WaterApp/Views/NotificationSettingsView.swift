//
//  NotificationSettingsView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/28/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct NotificationSettingsView: View {
    
    @EnvironmentObject var userStats : UserStats
    @State private var hours : Int = Int(UserPreferences.sd.getNotificationInterval())/3600
    @State private var min : Int = (Int(UserPreferences.sd.getNotificationInterval())%3600)/60
    

    var body: some View {
        
        VStack{
            Form {
                
                Section{
                                   
                    Toggle(isOn: $userStats.notificationsEnabled) {
                        Text("Notifications")
                
                    }
                }
                           
                               
            } // End Form
                .frame(height: 100)
            
            if (userStats.notificationsEnabled){
                  
                    
                VStack {
                    Text("Set Notification Interveral")
                    HStack{
                        Spacer()
                        Picker(selection: $hours ,label: Text("")) {
                            ForEach(0 ..< 24){
                                Text("\($0)").tag($0)
                            }
                        }.frame(width: 20, height: 180)
                            .fixedSize()
                        Text("hours")
                        Spacer()
                        Picker(selection: $min, label: Text("")){
                            ForEach(0 ..< 60){
                                Text("\($0)").tag($0)
                            }
                        }.frame(width: 20, height: 180)
                            .fixedSize()
                            
                        Text("min")
                        Spacer()
                    }
                    
                    TimerButtonComponent {
                        
                        let interval: Double = Double(self.hours*3600 + self.min*60)
                        LocalNotificationManager.shared.removeNotifications()
                        LocalNotificationManager.shared.setNotification(title: "Drink", body: "You should Drink Water", interval: interval)
                        // TODO - Later change to random messages
                    }
                     
                    
                    Text("Currently Notifying every: \(hours) hour and \(min) minutes")
                    
                    
                    
                    
                    
                }.onDisappear(perform: {
                    LocalNotificationManager.shared.removeNotifications()
                    print("notifications have been disabled")
                })
                    

            } else {
                EmptyView()
            }
            
                
            Spacer()
        } // End VStack
    }
}

struct NotificationSettingsView_Previews: PreviewProvider {
    
    @EnvironmentObject var userStats : UserStats
    
    static var previews: some View {
        NotificationSettingsView()
    }
}
