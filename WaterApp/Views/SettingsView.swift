//
//  MenuList.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/13/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var userStats : UserStats
    
    var body: some View {
        NavigationView {
             VStack {
                
                Text("Settings").font(.largeTitle).fontWeight(.bold).padding()
                Form {
                    Section{
                        NavigationLink(destination: NotificationSettingsView()) {
                        Text("Notifications")
                        }
                        
                        
                        Toggle(isOn: $userStats.isAthletic) {
                        Text("Athletic")
                        }
                    } // End Section 1
                    Section {
                        
                        Picker(selection: $userStats.isAthletic, label: Text("Theme")) {
                            Text("Yet to be implemented")
                            Text("Dark Theme").tag(1)
                            Text("Light Theme").tag(2)
                            Text("System Default").tag(3)
                        }
                    } // End Section 2
                } // Close Form
            } // Close VStack
            Spacer()
        }// Close NavigationView
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        
        SettingsView()
    }
}
