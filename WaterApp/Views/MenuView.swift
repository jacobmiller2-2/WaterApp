//
//  MenuView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/22/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var isAthletic: Bool
    @Binding var enableNotifications: Bool
    @Binding var consumptionGoal : Int
    
    var body: some View {
        
        VStack {
                
                Spacer()
                HStack{
                    NavigationLink(destination: SettingsView()){
                        Image(systemName: "person")
                            
                            .imageScale(.large)
                        Text("Profile")
                            
                            .font(.headline)
                    }.foregroundColor(Color.secondaryLabel)
                    
                }
                HStack {
                    Image(systemName: "envelope")
                        .imageScale(.large)
                    Text("Messages")
                        .font(.headline)
                }.foregroundColor(Color.secondaryLabel)
                    .padding(.top, 30)
                HStack {
                    NavigationLink(destination: SettingsView()){
                        Image(systemName: "gear")
                            .imageScale(.large)
                        Text("Settings")
                            .font(.headline)
                    }
                }.foregroundColor(Color.secondaryLabel)
                    .padding(.top, 30)
                 Spacer()
            }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.tertiarySystemBackground)
                .edgesIgnoringSafeArea(.all)
        
        }
}

struct MenuView_Previews: PreviewProvider {
    
    @State static var isAthletic = false
    @State static var enableNotifications = false;
    @State static var consumptionGoal = 0;
    
    static var previews: some View {
        MenuView(isAthletic: $isAthletic, enableNotifications: $enableNotifications, consumptionGoal: $consumptionGoal)
    }
}
