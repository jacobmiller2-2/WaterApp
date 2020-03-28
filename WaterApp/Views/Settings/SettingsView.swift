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
                VStack{
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
                        }
                    }.navigationBarTitle("Settings")// End List
                    .listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
                }
                    
            
        }// Close NavigationView
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        
        SettingsView()
    }
}
