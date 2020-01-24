//
//  UserProgressView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/12/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct UserProgressView: View {
    
    
    @Binding var isAthletic: Bool
    
    var body: some View {
        VStack{
            
            HStack {
                Text("Jacob,").padding()
                Spacer()
            }
           // Text("\(leftToDrink.roundToString(places: 2)) Oz.").font(.largeTitle).fontWeight(.light)
            Text("left to met your daily goal")
            
            if (isAthletic){
                Text("Athletic")
            } else {
                Text("Non-athletic")
            }
            
        }
        
    }
}

struct UserProgressView_Previews: PreviewProvider {
    
    @State static var isAthletic = UserStatsManager.shared.getAthleticism()
    
    static var previews: some View {
        UserProgressView(isAthletic: $isAthletic)
    }
}
