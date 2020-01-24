//
//  SidebarView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/24/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct SidebarView: View {
    @Binding var isMenuOpen: Bool
    @State var isAthletic: Bool = UserStatsManager.shared.getAthleticism()
    
    var body: some View {
        
        
        VStack{
            
            
            // fsedfesfsdfsdfdsfsd
            Image("waterdrop")
                .resizable()
                .scaledToFit()
            UserProgressView(isAthletic: $isAthletic)
            
            Spacer()
        }.onAppear(){
            self.isAthletic = UserStatsManager.shared.getAthleticism()
        
            print("right now \(self.isAthletic)")
        }
        .onDisappear(){
            self.isAthletic = UserStatsManager.shared.getAthleticism()
            print("after leaving, \(self.isAthletic)")
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    
    @State static var isMenuOpen = true
    
    static var previews: some View {
        SidebarView(isMenuOpen: $isMenuOpen)
    }
}
