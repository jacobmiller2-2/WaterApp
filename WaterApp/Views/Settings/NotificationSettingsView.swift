//
//  NotificationSettingsView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/28/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct NotificationSettingsView: View {
    
    @EnvironmentObject var uStats : UserStats
    
    @State private var hours : Int = Int(UserPreferences.sd.getNotificationInterval())/3600
    @State private var min : Int = (Int(UserPreferences.sd.getNotificationInterval())%3600)/60
    

    var body: some View {
        
        VStack{
            List {
                
                Section{
                                   
                    Toggle(isOn: $uStats.notificationsEnabled) {
                        Text("Notifications")
                    }
                    if (uStats.notificationsEnabled){
                        Toggle(isOn: $uStats.smartNotifications) {
                            Text("Enable Smart Notifications")
                        } //TODO: Disable button rather than making it disappear
                    }
                }
            } // End Form
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
            
            
            if (!uStats.notificationsEnabled || uStats.smartNotifications){
                EmptyView()
            } else {
                VStack {
                    //FIXME: picker size contraints
                    Text("Set Notification Interveral")
                    HStack{
                        Spacer()
                        Picker(selection: $hours ,label: Text("")) {
                            ForEach(0 ..< 24){
                                Text("\($0)").tag($0)
                            }
                        }
                        .frame(width: 20, height: 180)
                        .fixedSize()
                        Text("hours")
                        Spacer()
                        Picker(selection: $min, label: Text("")){
                            ForEach(0 ..< 60){
                                Text("\($0)").tag($0)
                            }
                        }
                        .frame(width: 20, height: 180)
                        .fixedSize()
                        Text("min")
                        Spacer()
                    }
                    
                    TimerButtonComponent {
                        let interval = Double(self.hours*3600 + self.min*60)
                        self.uStats.notificationInterval = interval
                        self.hours = Int(interval)/3600
                        self.min = (Int(interval)%3600)/60
                        LocalNotificationManager.shared.removeNotifications()
                        LocalNotificationManager.shared.setNotification(title: "Drink", body: "You should Drink Water", interval: interval)
                        // TODO:  Later change to random messages
                    }
                    
                    Text("Currently Notifying every:")
                    Text("\(uStats.notificationInterval.secondsToHoursMinutes())")
                    
                }.onDisappear(perform: {
                    if(!self.uStats.smartNotifications){
                        LocalNotificationManager.shared.removeNotifications()
                    } // TODO: Calculate smart interval
                    
                    
                    print("notifications have been disabled")
                })
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
