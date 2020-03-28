//
//  AppView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/24/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

// View rendered on on Startup

struct AppView: View {
    
    @EnvironmentObject var uStats : UserStats
    
       var body: some View {
        
        TabView{
            UserProgressView()
                .tabItem {
                    Image(systemName: "house.fill")
                        .imageScale(.large)
                    Text("Progress")
                    
                }
            UserStatsView()
                .tabItem{
                    Image(systemName: "person.circle.fill")
                        .imageScale(.large)
                    Text("Stats")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                        .imageScale(.large)
                    Text("Settings")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            
    }
}
