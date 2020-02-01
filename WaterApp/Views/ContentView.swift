//
//  ContentView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/3/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView : View {
    
    @EnvironmentObject var userStats: UserStats
    
    
    var body: some View {
        VStack{
            
            
            // fsedfesfsdfsdfdsfsd
            Image("waterdrop")
                .resizable()
                .scaledToFit()
                
            UserProgressView()
            
            Spacer()
        }
    }
    
    
    

    struct ContentView_Previews: PreviewProvider {
        
               
        static var previews: some View {
            ContentView()
        }
    }
}
