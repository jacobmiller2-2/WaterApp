//
//  StatSettingsView.swift
//  WaterApp
//
//  Created by Jacob Miller on 2/22/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct StatSettingsView: View {
    
    @EnvironmentObject var uStats: UserStats
    
    var body: some View {
        
        Form {
            Section(footer: Text("Turning on sets your water consumption goal to be a calculated value based on your weight, lifestyle type, and sex.")){
                Toggle(isOn: $uStats.smartGoalEnabled){
                    Text("Enable Smart Goal")
                }
            }
            
            if(uStats.smartGoalEnabled){
                Section{
                    HStack{
                        Text("Consumption Goal")
                        Spacer()
                        Text("\(uStats.consumptionGoal)")
                    }
                }.animation(.easeInOut)
            } else{
                Section{
                    Text("Consumption Goal")
                    TextField("Goal", value: $uStats.consumptionGoal, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.horizontal,30)
                }.animation(.easeInOut)
                
            }
            Section {
                Text("Bodyweight")
                
                TextField("Goal", value: $uStats.bodyWeight, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.horizontal,30)

                Toggle(isOn: $uStats.isAthletic){
                    Text("Do you have an active lifestyle?")
                }
            }.animation(.easeInOut)
        }
    }
 
}
