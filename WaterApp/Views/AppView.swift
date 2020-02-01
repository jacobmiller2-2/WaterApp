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
    
    @EnvironmentObject var userStats : UserStats
    
       var body: some View {
            
        TabView{
            ContentView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("ContentView")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                    Text("Settings")
                }

        }
            .onAppear(){
            
            }
            .onDisappear(){
                
            }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            
    }
}
