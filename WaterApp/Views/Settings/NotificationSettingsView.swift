//
//  NotificationSettingsView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/28/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct NotificationSettingsView: View {
    
    @EnvironmentObject var uNotifs : UserNotifications
    @EnvironmentObject var uStats : UserStats
    
    
    @State private var hours : Int = 1
    @State private var min : Int = 0
    

    var body: some View {
        VStack{
            List {
                Section(header: Text("")){
                    Toggle(isOn: $uNotifs.notificationsEnabled) {
                        Text("Notifications")
                    }
                }
                if(uNotifs.notificationsEnabled){
                    Section {
                        Toggle(isOn: $uNotifs.smartNotifications) {
                            Text("Enable Smart Notifications")
                        }.animation(.easeInOut)
                    }
                }
           } // End Form
            
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
            
            if(!uNotifs.smartNotifications){
                Text("Recieving Notifivations Every:")
                Text("\(uNotifs.notificationInterval.secondsToHoursMinutes())")
                    GeometryReader{geometry in
                        HStack{
                            Picker("",selection: self.$hours){
                                ForEach(0..<24){
                                    Text("\($0)").tag($0)
                                }
                                
                            }
                                .pickerStyle(WheelPickerStyle())
                                .frame(width:geometry.size.width / CGFloat(5))
                                .clipped()
                            Text("hours")
                            Picker("",selection: self.$min){
                                ForEach(0..<61){
                                    Text("\($0)").tag($0)
                                }
                                
                            }
                                .pickerStyle(WheelPickerStyle())
                                .frame(width:geometry.size.width / CGFloat(5))
                                .clipped()
                            Text("min")
                        }
                    }.animation(.easeInOut)
                    TimerButtonComponent {
                        if(self.hours == 0 && self.min == 0){
                            self.min = 1;
                        }
                        let interval = Double(self.hours*3600 + self.min*60)
                        self.uNotifs.notificationInterval = interval
                        self.hours = Int(interval)/3600
                        self.min = (Int(interval)%3600)/60
                        LocalNotificationManager.shared.removeAndSetNotifications(title: "Drink", body: "You should Drink Water", interval: interval)
                    }
                
            }
            Spacer()
        }
        
    }
    
}


