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
    
    @State var goal: String = ""
    @State var weight: String = ""
    @State var active: Bool = false
    
    
    var body: some View {
    
        
        Form {
            Section(footer: Text("Turning on sets your water consumption goal to be a calculated value based on your weight, lifestyle type, and sex.")){
                Toggle(isOn: $uStats.smartGoalEnabled){
                    Text("Enable Smart Goal")
                }
            }
            Section {
                Text("Conumption Goal")
                TextField("Goal", text: $goal).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.horizontal,30).keyboardType(.numberPad)
            }.disabled(uStats.smartGoalEnabled)
            
            Section {
                Text("Bodyweight")
                TextField("Bodyweight", text: $weight).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.numberPad)
                
                Toggle(isOn: $active){
                    Text("Do you have an active lifestyle?")
                }
            }.disabled(!uStats.smartGoalEnabled)
            Section{
                Button(action: {
                    
                    if(self.uStats.smartGoalEnabled){
                        self.uStats.bodyWeight = Int(self.weight) ?? self.uStats.bodyWeight
                        self.uStats.isAthletic = self.active
                         self.uStats.consumptionGoal = self.uStats.calculateConsumptionGoal(smartGoalOn: self.uStats.smartGoalEnabled, isActive: self.uStats.isAthletic, weight: self.uStats.bodyWeight, currentGoal: self.uStats.consumptionGoal)
                    }
        
                    self.uStats.consumptionGoal = Int(self.goal) ?? self.uStats.consumptionGoal
                    
                    print(self.uStats.bodyWeight)
                    print(self.uStats.calculateConsumptionGoal(smartGoalOn: self.uStats.smartGoalEnabled, isActive: self.uStats.isAthletic, weight: self.uStats.bodyWeight, currentGoal: self.uStats.consumptionGoal))
                }) {
                Text("Submit")
                }
            }
        }.onAppear(){
            self.goal = "\(self.uStats.consumptionGoal)"
            self.weight = "\(self.uStats.bodyWeight)"
            self.active = self.uStats.isAthletic
        }// End form
            .onDisappear(){
                self.uStats.consumptionGoal = self.uStats.calculateConsumptionGoal(smartGoalOn: self.uStats.smartGoalEnabled, isActive: self.uStats.isAthletic, weight: self.uStats.bodyWeight, currentGoal: self.uStats.consumptionGoal)
        }
    }
}

struct StatSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        StatSettingsView()
    }
}
