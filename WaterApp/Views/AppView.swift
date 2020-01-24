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
    
    @State var isAthletic = UserStatsManager.shared.getAthleticism()
    
    
       var body: some View {
            
           NavigationView {
            ContentView(isAthletic: $isAthletic)
            
           }
            .onAppear(){
                UserStatsManager.shared.setAthleticism(isAthletic: self.isAthletic)
            }
        
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
