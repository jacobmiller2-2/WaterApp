//
//  MenuList.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/13/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isAthletic: Bool
    
    
    
    
    var body: some View {
            List {
                HStack {
                    
                    Toggle(isOn: $isAthletic) {
                        Text("Athletic")
                    }
                }
                
            }.navigationBarTitle(Text("Title"))
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    
    @State static var isAthletic = UserStatsManager.shared.getAthleticism()
    static var previews: some View {
        
        SettingsView(isAthletic: $isAthletic)
    }
}
