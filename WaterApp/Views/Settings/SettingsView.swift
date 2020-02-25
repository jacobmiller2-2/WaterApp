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
            VStack(alignment: .leading) {
                List{   
                    Section{
                        NavigationLink(destination: NotificationSettingsView()) {
                        Text("Notifications")
                        }
                        
                        NavigationLink(destination: NameView()){
                            Text("Personal Preferences")
                        }
                        
                        NavigationLink(destination: StatSettingsView()){
                            Text("Personal Stats")
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
                    
                }
                    .navigationBarTitle("Settings")// End List
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
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
